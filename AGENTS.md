# AGENTS.md

## Purpose
This repository tracks Balatro mods and their metadata. When reviewing pull requests, validate metadata correctness, check download reliability, and provide clear fixes maintainers can apply quickly.

## Scope
- Review only files changed by the PR unless explicitly asked to run a full-repo audit.
- Use `README.md` and `schema/meta.schema.json` as source of truth.
- Focus on `mods/<Author>@<Modname>/` entries and their `meta.json`, `description.md`, and optional thumbnail.

## PR Review Workflow
1. Read `README.md` and `schema/meta.schema.json`.
2. List changed mod directories and changed `meta.json` files.
3. Validate metadata structure and schema rules.
4. Validate `downloadURL` behavior (must be real downloadable file/archive).
5. Validate automatic update settings and URL strategy.
6. Check required files and basic submission quality signals.
7. Check existing PR comments/reviews before posting feedback.
8. Report per mod: `Valid` or `Needs Change`, with exact fixes.

## Core Checks

### 1) Required Files and Layout
- Folder format should be `mods/Author@Modname/`.
- `description.md` must exist.
- `meta.json` must exist and be valid JSON.
- Thumbnail is optional, but if present it must be a `.jpg` file.
- Reject `.png`, `.jpeg`, or other thumbnail extensions.

### 2) `meta.json` Required Fields
Ensure required fields exist and types are correct:
- `title` (string)
- `requires-steamodded` (boolean)
- `requires-talisman` (boolean)
- `categories` (array, non-empty, unique, allowed values only)
- `author` (string)
- `repo` (URI)
- `downloadURL` (URI)
- `version` (string)

### 3) Category and Value Validation
`categories` entries must be one or more of:
- `Content`
- `Joker`
- `Quality of Life`
- `Technical`
- `Miscellaneous`
- `Resource Packs`
- `API`

### 4) Folder Name Rules
If `folderName` exists:
- It should be unique in the index.
- It must not contain invalid characters: `<` `>` `:` `"` `/` `\` `|` `?` `*`

### 5) Download URL Validation
A `downloadURL` is valid when:
- Reachable without manual steps.
- Returns a downloadable file/archive (zip/tar.gz/etc.), not a repository HTML page.
- Does not use non-download links (`/tree/`, `/blob/`, repo root, release overview page without an asset URL).

### 6) Automatic Version Check Rules
If `automatic-version-check` is `true`, verify `downloadURL` points to an automatically updating source.

Preferred patterns:
- Latest release asset URL
- Branch archive URL like `https://github.com/<owner>/<repo>/archive/refs/heads/main.zip`

If `downloadURL` points to a specific release tag asset (`/releases/download/<tag>/...`):
- `fixed-release-tag-updates` must be `true`
- `automatic-version-check` must be `true`

### 7) Repo/Metadata Consistency
- `repo` and `downloadURL` should refer to the same project.
- `author` in metadata should reasonably match the submission path (`Author@Modname`) unless intentionally different.
- `version` should match the downloadable artifact versioning strategy.

### 8) Description and Dependency Clarity
In `description.md`, check for:
- Basic install/use context.
- Mention of required dependencies when relevant (Steamodded/Talisman/other critical deps).

### 9) Third-Party Submission Signals
For mods submitted by someone other than creator, flag if unclear:
- Redistribution permission/license status.
- Whether the mod appears abandoned/deprecated.
- Whether using stable release links is possible instead of volatile HEAD links.

### 10) Thumbnail Extension Policy
- Only `.jpg` thumbnails are accepted in this repository.
- If a PR uses `thumbnail.png`, `thumbnail.jpeg`, or any other extension, mark it `Needs Change`.

## Recommendation Rules for Download Links
For users with `automatic-version-check: true` using weak or non-file links:
- Recommend direct archive/release asset URLs.
- For GitHub branch-based auto updates, suggest:
  - `https://github.com/<owner>/<repo>/archive/refs/heads/main.zip`
  - Use `master.zip` equivalent when default branch is `master`.

## Reporting Format
For each mod reviewed, include:
- Mod path
- Current `downloadURL`
- Automatic version flags (`automatic-version-check`, `fixed-release-tag-updates`)
- Validation result: `Valid` or `Needs Change`
- Findings (concise)
- Exact replacement recommendation(s), if needed

End with summary totals:
- Total checked
- Valid
- Needs changes
- Auto-check mods needing archive/release-link fixes

## Review Hygiene (No Duplicates)
- Before posting a new review/comment, check existing bot/maintainer comments on that PR.
- If the same issue was already reported, do not post it again.
- Prefer one consolidated `REQUEST_CHANGES` review per PR instead of multiple repeated reviews.
- If new context appears, update the previous feedback thread or post only the delta.
- Keep review comments short and actionable.

## Commit Message Style
- Use conventional commit prefixes for all commits in this repo.
- Preferred prefixes: `fix:`, `docs:`, `chore:`, `refactor:`, `test:`, `ci:`.
- Keep the subject short and specific (one line).
- Example: `fix: auto-run PR validation and post short feedback`.
