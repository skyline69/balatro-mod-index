# Balatro Mod Index Guide

![Balatro Image](https://github.com/skyline69/balatro-mod-index/blob/main/media/Balatro.jpg?raw=true)

This repository indexes Balatro mods for use in Balatro Mod Manager.
Follow this guide to submit mods that pass validation quickly.

## Want to upload a new mod?

First, check the information below for what to submit, then use the [BMI Submission Helper](https://bmi-helper.dasguney.com/) to easily upload new Mods to the index!
After the PR has been made, Reviewers will check if the Submission is safe and ready to merge and your Mod will be on the Index in no time!

**(Make sure to read this entire file for help so you don't open an issue for something resolved here)**


## `meta.json` Fields

Example:  
(Don't write whats in red! Even though this is a manual step the fields here are basically the same if you're doing this via the website.)
```json
{
  "title": "Extended Cards", -- The name of your mod that'll appear on the mod manager.
  "requires-steamodded": true, -- Does the mod require the steamodded API?
  "requires-talisman": false, -- Does the mod require the talisman API? (talisman adds exponential mult and chips!)
  "categories": ["Content"], -- Table of categories (example: ["Content", "Joker"] ect..)
  "author": "Joe Mama", -- The person who made the mod, will appear on the manager.
  "repo": "https://github.com/joemama/extended-cards", -- The repo where the mod is released.
  "downloadURL": "https://github.com/joemama/extended-cards/releases/latest/download/extended-cards.zip", -- Refer to "Download URL Rules"
  "folderName": "ExtendedCards", -- Optional, the name of the folder in the balatro/mods folder.
  "version": "1.0.0", -- The current version of your mod.
  "automatic-version-check": true -- Whether to automatically update the version (refer to "Automatic Version Check Rules" for more info)
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
- `Resource Packs` - The mod changes the look of the game.
- `API` - The mod adds features to make coding another mod easier.
- `Extension` - The mod is an extension of another mod.

## Download URL Rules (Important)

`downloadURL` must resolve to a real downloadable file (zip/tar/etc).
Do not use repository or release HTML page URLs.

### Accepted examples

- `https://github.com/<owner>/<repo>/releases/latest/download/mod.zip` (You must upload it using [This button)](https://github.com/user-attachments/assets/da972ca3-3dec-47f6-b786-a34f6894e687)
- `https://github.com/<owner>/<repo>/archive/refs/heads/main.zip` (This mimics pressing the green "code" button then clicking "download zip"!)
- `https://github.com/<owner>/<repo>/archive/refs/heads/master.zip` (This mimics pressing the green "code" button then clicking "download zip"!)
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

- If the link has `releases/latest`
- If the link has `archive/refs/heads/main.zip` or `archive/refs/heads/master.zip`

If your `downloadURL` uses a fixed release tag asset like:

- `https://github.com/<owner>/<repo>/releases/download/<tag>/mod.zip`

then you must set:

- `automatic-version-check: true`
- `fixed-release-tag-updates: true`

This is required to avoid accidental update freeze behavior.

## Description Suggestions
- Make sure to include a summary of your mod with proper formatting, markdown is supported.
- Please, do not just write "My cool balatro mod that adds 10 jokers".
- Examples: [1](https://github.com/skyline69/balatro-mod-index/blob/main/mods/ABGamma%40Brainstorm-Rerolled/description.md), [2](https://github.com/skyline69/balatro-mod-index/blob/main/mods/Alex%40Mayhem/description.md), if your mod doesn't need much explaining you can also try something like [this](https://github.com/skyline69/balatro-mod-index/blob/main/mods/Virtualized%40Multiplayer/description.md), if your mod doesn't add many jokers you can also explain them all like [this](https://github.com/skyline69/balatro-mod-index/blob/main/mods/pawPatoes%40roze/description.md)


## Thumbnail Rules

- Thumbnail is optional.
- If included, filename must be exactly `thumbnail.jpg`.
- JPEG content only (`image/jpeg`).
- Recommended max dimensions: `1920x1080`.
- If it isn't accepted, make it a jpeg using any image editing software. (yes, even paint can do it)

## How To Submit
### Disclaimer
* After submitting a mod, please make sure to check github often to see if your mod had an issue/got rejected!

Automatic way: https://bmi-helper.dasguney.com/  

Manual:
1. Fork this repository.
2. Add your mod folder inside the "mods" directory using the format: `AuthorName@Modname/`
3. Add `description.md` and `meta.json`.
4. Optionally add `thumbnail.jpg`.
5. Commit and push.
6. Open a PR to `main` after reading and verifying the quick checklist.

## Quick Checklist

Before opening a PR, make sure all of the following are true:

- Your mod folder location is in the `mods` folder, and your mod folder name is `AuthorName@ModName`
- `description.md` exists
- `meta.json` exists and is valid JSON
- Thumbnail is optional, but if present it must be called `thumbnail.jpg` (JPEG only)
- `downloadURL` points directly to a downloadable file/archive (not an HTML page)
- `categories` only uses allowed values
- `version` is present and matches the downloadable artifact

## Required Structure

```text
mods/
  AuthorName@Modname/
    description.md       # required
    meta.json            # required
    thumbnail.jpg        # optional, JPG only
```


## PR Title Suggestion  
(Ignore this if you're doing this via the website!)

Use a clear title for your pull request, for example:

- `Add AuthorName@Modname mod`

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
