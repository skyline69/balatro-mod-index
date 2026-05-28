# Balatro Mod Index Guide

![Balatro Image](https://github.com/skyline69/balatro-mod-index/blob/main/media/Balatro.jpg?raw=true)

This repository indexes Balatro mods for use in Balatro Mod Manager.
Follow this guide to submit mods that pass validation quickly.

## You want to upload a new mod?

Use the [BMI Submission Helper](https://bmi-helper.dasguney.com/) to easily upload new Mods to the index!
After the PR has been made, Reviewers will check if the Submission is safe and ready to merge and your Mod will be on the Index in no time!

## Quick Checklist

Before opening a PR, make sure all of the following are true:

- Your mod folder is `mods/Author@Modname/`
- `description.md` exists
- `meta.json` exists and is valid JSON
- Thumbnail is optional, but if present it must be called `thumbnail.jpg` (JPEG only)
- `downloadURL` points directly to a downloadable file/archive (not an HTML page)
- `categories` only uses allowed values
- `version` is present and matches the downloadable artifact

## Required Structure

```text
mods/
  Author@Modname/
    description.md       # required
    meta.json            # required
    thumbnail.jpg        # optional, JPG only
```

## `meta.json` Fields

Example:

```json
{
  "title": "Extended Cards",
  "requires-steamodded": true,
  "requires-talisman": false,
  "categories": ["Content"],
  "author": "Joe Mama",
  "repo": "https://github.com/joemama/extended-cards",
  "downloadURL": "https://github.com/joemama/extended-cards/releases/latest/download/extended-cards.zip",
  "folderName": "ExtendedCards",
  "version": "1.0.0",
  "automatic-version-check": true
}
```

Required fields:

- `title` (string)
- `requires-steamodded` (boolean)
- `requires-talisman` (boolean)
- `categories` (array, at least 1)
- `author` (string)
- `repo` (valid URL)
- `downloadURL` (valid URL)
- `version` (string)

Optional fields:

- `folderName` (string, unique, no invalid filename chars)
- `automatic-version-check` (boolean)
- `fixed-release-tag-updates` (boolean)

Allowed category values:

- `Content` - The mod adds content to the game.
- `Joker` - The mod has a relation to jokers.
- `Quality of Life` - The mod adds features to improve the balatro experience.
- `Technical` - The mod changes the game in technical ways.
- `Miscellaneous` - The mod doesn't fit into any of these categories.
- `Resource Packs` - The mod changes the look of the game
- `API` - The mod adds features to make coding another mod easier.
- `Extension` - The mod is an extension of another mod.

## Download URL Rules (Important)

`downloadURL` must resolve to a real downloadable file (zip/tar/etc).
Do not use repository or release HTML page URLs.

### Accepted examples

- `https://github.com/<owner>/<repo>/releases/latest/download/mod.zip` (You must upload it using [This button)](https://github.com/user-attachments/assets/da972ca3-3dec-47f6-b786-a34f6894e687)
- `https://github.com/<owner>/<repo>/archive/refs/heads/main.zip` (This requires the uploaded content to be the mod fodler contents!)
- `https://github.com/<owner>/<repo>/archive/refs/heads/master.zip` (This requires the uploaded content to be the mod fodler contents!)
- `https://github.com/<owner>/<repo>/releases/download/<tag>/mod.zip` (You must upload it using [This button)](https://github.com/user-attachments/assets/da972ca3-3dec-47f6-b786-a34f6894e687)

### Rejected examples

- `https://github.com/<owner>/<repo>` - This doesn't download anything.
- `https://github.com/<owner>/<repo>/tree/main` - This doesn't download anything.
- `https://github.com/<owner>/<repo>/blob/main/mod.zip` - This is a blob, not accepted.
- `https://github.com/<owner>/<repo>/releases/latest` - This doesn't download anything.
- `https://github.com/<owner>/<repo>/releases/tag/v1.2.3` - This doesn't download anything.

## Automatic Version Check Rules

`automatic-version-check` is optional but recommended.

Enable it only if `downloadURL` points to an automatically updating source:

- If the link has releases/latest
- If the link is has `archive/refs/heads/main.zip`

If your `downloadURL` uses a fixed release tag asset like:

- `https://github.com/<owner>/<repo>/releases/download/<tag>/mod.zip`

then you must set:

- `automatic-version-check: true`
- `fixed-release-tag-updates: true`

This is required to avoid accidental update freeze behavior.

## Thumbnail Rules

- Thumbnail is optional.
- If included, filename must be exactly `thumbnail.jpg`.
- JPEG content only (`image/jpeg`).
- Recommended max dimensions: `1920x1080`.
- If it isn't accepted, make it a jpeg using any image editing software (yes even paint can do it)

## How To Submit
Automatic way: https://bmi-helper.dasguney.com/  

Manual:
1. Fork this repository.
2. Add your mod folder inside the "mods" folder with the name `mods/Author@Modname/`.
3. Add `description.md` and `meta.json`.
4. Optionally add `thumbnail.jpg`.
5. Commit and push.
6. Open a PR to `main`.

## PR Title Suggestion

Use a clear title, for example:

- `Add Author@Modname mod`

## Validation and Review

Your PR is checked automatically by GitHub Actions.
A maintainer then reviews:

- metadata correctness
- download URL validity
- update logic consistency
- submission safety/policy compliance

## Submission Policy

All submissions must be safe, legal, and appropriate for a general audience.

Not allowed:

1. Malware/spyware.
2. Copyrighted content without permission.
3. Hateful, discriminatory, or offensive material.

By submitting a mod, you agree to allow it to be displayed in and redistributed by [Balatro Mod Manager](https://github.com/skyline69/balatro-mod-manager/).

If you want content removed later, open an [Issue](https://github.com/skyline69/balatro-mod-index/issues) or submit a PR that removes the content.

## Third-Party Submissions

Prefer submissions by the original creator.
If you submit someone else's mod, verify all of the following:

1. Mod is still working and not abandoned/deprecated.
2. License allows redistribution, or explicit public permission exists.
3. Dependencies are correctly represented (`requires-steamodded`, `requires-talisman`, and other requirements in `description.md`).
4. Required install folder behavior is reflected by `folderName` when needed.
5. Any special install instructions are documented in `description.md`.

For third-party submissions, prefer stable release links instead of volatile dev snapshots whenever possible.

Thanks for contributing to Balatro Mod Index.
