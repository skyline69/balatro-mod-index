#!/usr/bin/env python3

import json
import os
import re
import sys
import time
from datetime import datetime
from enum import Enum
from pathlib import Path

import requests

# GitHub API rate limits are higher with authentication
GITHUB_TOKEN = os.environ.get('GITHUB_TOKEN')
HEADERS = {'Authorization': f'token {GITHUB_TOKEN}'} if GITHUB_TOKEN else {}

def extract_repo_info(repo_url):
    """Extract owner and repo name from GitHub repo URL."""
    match = re.search(r'github\.com/([^/]+)/([^/]+)', repo_url)
    if match:
        owner = match.group(1)
        repo = match.group(2)
        # Remove .git suffix if present
        repo = repo.removesuffix('.git')
        return owner, repo
    return None, None

VersionSource = Enum("VersionSource", [
    ("LATEST_TAG", "release"),
    ("HEAD", "commit"),
    ("SPECIFIC_TAG", "specific_tag"),
])
def get_version_string(source: Enum, owner, repo, start_timestamp, n = 1, tag_data=None):
    """Get the version string from a given GitHub repo."""
    
    if source is VersionSource.LATEST_TAG:
        url = f'https://api.github.com/repos/{owner}/{repo}/releases/latest'
    elif source is VersionSource.SPECIFIC_TAG:
        if not tag_data:
            print(f"ERROR: SPECIFIC_TAG source requires tag_name")
            return None
        
        tag_name = tag_data['name']
        url = f'https://api.github.com/repos/{owner}/{repo}/releases/tags/{tag_name}'
    else:
        if not source is VersionSource.HEAD:
            print(f"UNIMPLEMENTED(VersionSource): `{source}`,\nfalling back to `HEAD`")
            source = VersionSource.HEAD
        url = f'https://api.github.com/repos/{owner}/{repo}/commits'

    try:
        response = requests.get(url, headers=HEADERS)
        
        api_rate_limit = int(response.headers.get('x-ratelimit-limit'))
        api_rate_usage = int(response.headers.get('x-ratelimit-used'))
        api_rate_remaining = int(response.headers.get('x-ratelimit-remaining'))
        api_reset_timestamp = int(response.headers.get('x-ratelimit-reset'))
        api_resource = response.headers.get('x-ratelimit-resource')
        print(f"GitHub API ({api_resource}) calls: {api_rate_usage}/{api_rate_limit}")

        if response.status_code == 404:
            # Not found
            return None

        if response.status_code == 200:
            data = response.json()

            if source is VersionSource.LATEST_TAG:
                # Return name of latest tag
                return data.get('tag_name')

            elif source is VersionSource.SPECIFIC_TAG:
                assets = data.get('assets', [])
                if not assets:
                    print(f"⚠️ No assets found in release {tag_name}")
                    return None

                latest_created_at = ""
                latest_asset = None
                
                for asset in assets:
                    created_at = asset.get('created_at', '')
                    if created_at > latest_created_at:
                        latest_created_at = created_at
                        latest_asset = asset.name

                # Convert 2099-12-31T01:02:03Z to 20991231_010203
                parts = latest_created_at.replace('Z', '').split('T')
                date_part = parts[0].replace('-', '')  # 20991231
                time_part = parts[1].replace(':', '')  # 010203
                version = f"{date_part}_{time_part}"   # 20991231_010203
                tag_data['file'] = latest_asset
                return version

            if data and len(data) > 0:
                # Return shortened commit hash (first 7 characters)
                return data[0]['sha'][:7]

            print(f"⚠️ Warning: unexpected response format for {source}s:\n{
                json.dumps(data, indent=2, ensure_ascii=False)
            }")
            return

        if api_rate_remaining == 0 or (
            response.status_code == 403
            and "rate limit exceeded" in response.text.lower()
        ):
            print(f"GitHub API access is being rate limited!")
            current_timestamp = int(time.time())
            
            # Check if primary rate limit is okay
            if api_rate_remaining > 0:
                # Secondary rate limit hit, follow GitHub instructions
                if 'retry-after' in response.headers:
                    wait_time = int(response.headers.get('retry-after')) + 5
                    print(f"Response retry-after {wait_time}s")
                else:
                    # Start at 60 seconds and double wait time with each new attempt
                    print(f"Attempt {n}")
                    wait_time = 60 * pow(2, n - 1)
            else:
                api_reset_time = datetime.fromtimestamp(api_reset_timestamp).strftime('%H:%M:%S')
                print(f"GitHub API rate limit resets at {api_reset_time}")
                wait_time = api_reset_timestamp - current_timestamp + 5

            # Wait only if the wait time would finish less than 1800 seconds (30 min) after program start time
            if current_timestamp + wait_time - start_timestamp < 1800:
                print(f"Waiting {wait_time} seconds until next attempt...")
                time.sleep(wait_time)
                n += 1
                return get_version_string(source, owner, repo, start_timestamp, n, tag_data=tag_data)  # Retry
            else:
                print(f"Next attempt in {wait_time} seconds, but Action run time would exceed 1800 seconds - Stopping...")
                sys.exit(1)

        else:
            print(f"Error fetching {source}s: HTTP {response.status_code} - {response.text}")
            return None
    except Exception as e:
        print(f"Exception while fetching {source}s: {str(e)}")
        return None

def process_mods(start_timestamp):
    """Process all mods and update versions where needed."""
    mods_dir = Path('mods')
    updated_mods = []
    print(f"Scanning {mods_dir} for mods with automatic version control...")
    
    # Find all mod directories
    for mod_dir in (d for d in mods_dir.iterdir() if d.is_dir()):
        meta_file = mod_dir / 'meta.json'
        
        if not meta_file.exists():
            continue

        try:
            if mod := process_mod(start_timestamp, mod_dir.name, mod_dir / 'meta.json'):
                updated_mods.append(mod)
        except Exception as e:
            print(f"❌ Error processing {mod_dir.name}: {str(e)}")
            
    return updated_mods

def process_mod(start_timestamp, name, meta_file):
    if not meta_file.exists():
        return

    with open(meta_file, 'r', encoding='utf-8') as f:
        meta = json.load(f)
        
    # Skip mods without automatic version checking enabled
    if not meta.get('automatic-version-check'):
        return

    print(f"Processing {name}...")
    
    repo_url = meta.get('repo')
    if not repo_url:
        print(f"⚠️ Warning: Mod {name} has automatic-version-check but no repo URL")
        return
        
    owner, repo = extract_repo_info(repo_url)
    if not owner or not repo:
        print(f"⚠️ Warning: Could not extract repo info from {repo_url}")
        return

    print(f"Checking GitHub repo: `{owner}/{repo}`")
        
    # If download url links to latest head, use version of latest commit hash
    download_url = meta.get('downloadURL')

    new_version = None

    if "/archive/refs/heads/" in download_url:
        print("Download URL links to HEAD, checking latest commit...")
        source = VersionSource.HEAD
        new_version = get_version_string(VersionSource.HEAD, owner, repo, start_timestamp)
    elif (meta.get('fixed-release-tag-updates') == True):
        print("Download URL links to specific tag, checking that tag...")
        source = VersionSource.SPECIFIC_TAG
        tag_data = {}
        
        if "/releases/download/" in download_url:
            # Pattern: /releases/download/{tag}/{file} - tag is second-to-last
            tag_data['name'] = download_url.split('/')[-2]
        else:
            # Pattern: /releases/tag/{tag} - tag is last
            tag_data['name'] = download_url.split('/')[-1]

        new_version = get_version_string(
            source, owner, repo, start_timestamp, tag_data=tag_data
        )
    else:
        print("Checking releases for latest version tag...")
        source = VersionSource.LATEST_TAG
        new_version = get_version_string(source, owner, repo, start_timestamp)

        if not new_version:
            print("No releases found, falling back to latest commit instead...")
            source = VersionSource.HEAD
            new_version = get_version_string(source, owner, repo, start_timestamp)

    if not new_version:
        print(f"⚠️ Warning: Could not determine version for {name}")
        return

    current_version = meta.get('version')
    # Update version if it changed
    if current_version == new_version:
        print(f"ℹ️ No version change for {name} (current: {current_version})")
        return

    print(
        f"✅ Updating {name} from {current_version} to {new_version} ({source})"
    )
    meta['version'] = new_version
    if "/archive/refs/tags/" in download_url:
        meta['downloadURL'] = f"{repo_url}/archive/refs/tags/{meta['version']}.zip"
    elif source == VersionSource.SPECIFIC_TAG:
        meta['downloadURL'] = f"{repo_url}/releases/download/{tag_data['name']}/{tag_data['file']}"
    
    with open(meta_file, 'w', encoding='utf-8') as f:
        # Preserve formatting with indentation
        json.dump(meta, f, indent=2, ensure_ascii=False)
        f.write("\n")  # Add newline at end of file

    return {
        'name': meta.get('title', name),
        'old_version': current_version,
        'new_version': meta['version'],
        'source': source
    }


def generate_commit_message(updated_mods):
    """Generate a detailed commit message listing all updated mods."""
    if not updated_mods:
        return "No mod versions updated"
        
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    message = f"Auto-update mod versions ({timestamp})\n\n"
    message += "Updated mods:\n"
    
    for mod in updated_mods:
        old_ver = mod['old_version'] or 'none'
        message += f"- {mod['name']}: {old_ver} → {mod['new_version']} ({mod['source']})\n"
        
    return message


if __name__ == "__main__":
    start_timestamp = int(time.time())
    start_datetime = datetime.fromtimestamp(start_timestamp).strftime('%H:%M:%S')
    print(f"🔄 Starting automatic mod version update at {start_datetime}...")
    updated_mods = process_mods(start_timestamp)
    
    if updated_mods:
        # Write commit message to a file that the GitHub Action can use
        commit_message = generate_commit_message(updated_mods)
        with open('commit_message.txt', 'w', encoding='utf-8') as f:
            f.write(commit_message)
        
        print(f"✅ Completed. Updated {len(updated_mods)} mod versions.")
    else:
        print("ℹ️ Completed. No mod versions needed updating.")
    
    # Exit with status code 0 even if no updates were made
    sys.exit(0)
