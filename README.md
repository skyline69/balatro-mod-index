# Balatro Mod Index Guide
![Balatro Image](https://github.com/skyline69/balatro-mod-index/blob/main/media/Balatro.jpg?raw=true)
This guide explains how to structure and publish your Balatro mods in the *Balatro Mod Index* repository. Follow the instructions below carefully to ensure your mod is properly added.

## Directory Structure

Your mod should have the following structure inside the `mods/` directory:
- mods/
    - Author@Modname/
        - thumbnail.jpg (optional but preferred)
        - description.md (required)
        - meta.json (required)

### Example
For a mod titled "Pokermon" by "InertSteak":

- mods/
    - InertSteak@Pokermon/
        - thumbnail.jpg
        - description.md
        - meta.json

## Required Files

### 1. description.md
A markdown file describing your mod's features, installation steps, and any additional details you wish to share.

### 2. meta.json
This file stores essential metadata in JSON format. **Make sure you adhere to the valid categories and mod-loader options.** Below is an example:
```json
{
  "title": "Extended Cards",
  "requires-steamodded": true,
  "requires-talisman": false,
  "categories": ["Content"],
  "author": "Joe Mama",
  "repo": "https://github.com/joemama/extended-cards",
  "downloadURL": "https://github.com/joemama/extended-cards/releases/latest/extended-cards.zip",
  "folderName": "ExtendedCards",
  "version": "1.0.0",
  "automatic-version-check": true
}

```
- **title**: The name of your mod.
- **requires-steamodded**: If your mod requires the [Steamodded](https://github.com/Steamodded/smods) mod loader, set this to `true`.
- **requires-talisman**: If your mod requires the [Talisman](https://github.com/MathIsFun0/Talisman) mod, set this to `true`.
- **categories**: Must contain at least one of `Content`, `Joker`, `Quality of Life`, `Technical`, `Miscellaneous`, `Resource Packs` or `API`.
- **author**: Your chosen username or handle.
- **repo**: A link to your mod's repository.
- **downloadURL**: A direct link to the latest version of your released mod. Using an automatic link to the [latest release](https://docs.github.com/en/repositories/releasing-projects-on-github/linking-to-releases) is preferred.
- **version**: The version number of the mod files available at `downloadURL`.
- *folderName*: (*Optional*) The name for the mod's install folder. This must be **unique**, and cannot contain characters `<` `>` `:` `"` `/` `\` `|` `?` `*`
- *automatic-version-check*: (*Optional* but **recommended**) Set to `true` to let the Index automatically update the `version` field.
    - Updates happen once every hour, by checking either your mod's latest Release, latest commit, or specific release tag, depending on the `downloadURL`.
    - Enable this option **only** if your `downloadURL` points to an automatically updating source:
        - **Latest release** (recommended): Using a link to [releases/latest](https://docs.github.com/en/repositories/releasing-projects-on-github/linking-to-releases) 
        - **Latest commit**: Using a link to the [latest commit (HEAD)](https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives#source-code-archive-urls)
        - **Permanent release tag**: Using a link to a specific release tag where you upload new files: `https://github.com/author/repo/releases/tag/my-release-tag`. **(This will always use the latest uploaded file)**.

### 3. thumbnail.jpg (Optional)
If included, this image will appear alongside your mod in the index. Maximum and recommended size is 1920x1080 pixels.

## How to Publish

1. **Fork the Balatro Mod Index Repository**  
   Go to the main Balatro Mod Index repository on GitHub and click **Fork** to create your own copy.

2. **Create a New Mod Directory**  
   Under `mods/`, add a folder named `Author@Modname` (e.g., `InertSteak@Pokermon`).  
   Inside it, include:  
   - `description.md` (**required**)  
   - `meta.json` (**required**)  
   - `thumbnail.jpg` (optional but recommended)

3. **Write Your Mod Description**  
   Use `description.md` to explain what your mod does, key features, and any usage instructions.

4. Populate `meta.json`

5. **Commit and Push**  
Commit your directory and files, then push them to your fork.

6. **Open a Pull Request (PR)**  
From your fork, open a Pull Request to the main repository's default branch (e.g., `main`):  
- **Title**: *"Add Author@Modname mod"*  
- **Description**: Briefly describe your mod's purpose or any extra details.

7. **Automated Checks**  
As soon as you open the PR, GitHub Actions runs the automated checks to ensure your mod meets the required standards. If any checks fail, you will need to address the issues before your PR can be merged.

8. **Manual Review**  
A project maintainer or designated reviewer will review your PR to confirm it meets ethical, technical, and overall quality standards.

9. **Merge**  
Once the automated checks and manual review pass, your PR will be merged. Your mod then becomes part of the **Balatro Mod Index**!

Once your submission is reviewed and approved, your mod will be added to the Balatro Mod Index!

---

## Submission Policy

All submissions must be safe, legal, and appropriate for a general audience. This means:
1. No mods containing malware or spyware.

2. No copyrighted content that is used without permission.
   
3. No hateful, discriminatory, or offensive material.

By submitting your own mod to the *Balatro Mod Index*, you are agreeing to allow your mod to be displayed in and redistributed by [Balatro Mod Manager](https://github.com/skyline69/balatro-mod-manager/).
If you would like your content to be removed from the *Balatro Mod Index* at any point, please create an [Issue](https://github.com/skyline69/balatro-mod-index/issues) or submit a [Pull Request](https://github.com/skyline69/balatro-mod-manager/pulls) with the relevant content deleted.


### Third-Party Submissions
Mods should ideally be submitted by their creators. If you would like to submit a mod on behalf of a mod's creator, please do so in a way that is considerate of the author, their creative works, and their time.

Mods will only be accepted on the Balatro Mod Index if they have been released under a redistribution-friendly license (such as GPL, MIT, MPL or similar), or if the mod's authors have given explicit and public permission.
It is strongly encouraged to ask for permission before submitting other's mods to the *Balatro Mod Index*, regardless of license.

**Before submitting mods created by other people:**
1. Check that the mod is **working** on the most current version of the game, and has not been **deprecated** or **abandoned**.

2. Check that the mod's **license** allows **redistribution** by third parties - otherwise, **ask permission** from the creator.
   
3. Check the mod's requirements for **Steamodded** and **Talisman**, along with any other dependencies that should be listed in the description.
   
4. Check if the mod requires a specific installation **folder name**, and set the `folderName` parameter accordingly.
   
5. Check that the mod doesn't have any other special or unusual **installation requirements**.
   
6. Check if the mod has any **promotional images** that might be suitable for use as a **thumbnail**.

When submitting a mod on behalf of someone else, please link to the latest **Release** whenever possible rather than the latest repository HEAD.
This helps to keep modded Balatro stable for more players, by only using tested releases instead of potentially untested in-development builds.


Thanks for contributing to the *Balatro Mod Index* and helping the community grow! 
