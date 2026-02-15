# AGENTS.md

## Purpose
This repository tracks Balatro mods and their metadata. When reviewing pull requests, validate that `downloadURL` values point to real downloadable files and provide actionable recommendations for maintainers.

## Scope
- Review only files changed by the PR unless explicitly asked to run a full-repo audit.
- Focus on `meta.json` validity, especially `downloadURL` and version-check related fields.
- Use `README.md` as the source of truth for repository conventions.

## PR Review Workflow
1. Read `README.md` and confirm current metadata rules.
2. List changed `meta.json` files in the PR.
3. For each changed mod entry:
- Parse `downloadURL`.
- Verify the URL resolves to an actual file download (direct archive/file endpoint, not a repository landing page).
- Flag URLs that return HTML pages or require manual navigation.
4. If automatic version checking is enabled for the mod, recommend stable archive links when applicable:
- Prefer links like `https://github.com/<owner>/<repo>/archive/refs/heads/main.zip`
- Or equivalent archive endpoints for the host in use.
5. Report results per mod:
- `Valid` / `Needs Change`
- Why
- Exact suggested replacement URL when needed

## Validation Criteria
A `downloadURL` is considered valid when:
- It is reachable.
- It points directly to a file/archive (zip, tar.gz, etc.) that can be downloaded.
- It does not rely on HTML repo pages (`/tree/`, `/blob/`, root repo pages, release overview pages without asset links).

## Common Fix Pattern (GitHub)
Use:
- `https://github.com/<owner>/<repo>/archive/refs/heads/main.zip`

Avoid:
- `https://github.com/<owner>/<repo>`
- `https://github.com/<owner>/<repo>/tree/main`
- `https://github.com/<owner>/<repo>/blob/main/...`

## Reporting Format
For each mod reviewed, include:
- Mod path
- Current `downloadURL`
- Validation result
- Recommendation (if any)

End with a short summary:
- Total checked
- Valid
- Needs changes
- Mods with auto-version-check enabled that should switch to archive URLs
