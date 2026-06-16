![Banner](https://codeberg.org/BalatroMayhem/Mayhem/raw/branch/main/repoassets/banner.png)
# Mayhem
Big Balatro content mod based on chains of fusions with Jokers. Each fusion results in a much stronger Joker, leading up to the endgame where you can score incomprehensibly high numbers with scaling hyperoperators.  

Original mod found on [CodeBerg](https://codeberg.org/BalatroMayhem/Mayhem). This is an unofficial release, no changes are made to the mod, however this was uploaded by [pawPatoes](https://github.com/pawPatoes) with [Permission From Alex](https://codeberg.org/BalatroMayhem/Mayhem/issues/28#issuecomment-17288315)

Yeah this mod is not vanilla-friendly. 

The catch is that Mayhem is not a free win button. You can obviously soar past Ante 8, but that's not winning. Mayhem runs are supposed to take a ludicrous amount of time and getting past Ante 8 is just a stage of your run. Think of it like an incremental game, except it's a single run of Balatro.

![Screenshot](https://codeberg.org/BalatroMayhem/Mayhem/raw/branch/main/repoassets/screenshot.png)

That is actual gameplay footage.

** **

# SEIZURE AND AUDIO WARNING
Mayhem has a bunch of effects for scoring really high numbers that may trigger epileptic reactions. If you are prone to flashing lights and shaking things, disable some settings in the mod's Effects tab.

Mayhem also has custom operation sounds which get very intense. If your headphones/speakers start distorting and/or the noises are unpleasant, you can disable them in the Audio tab or toggle some less intense versions of those sounds.

# Installation
### [Video installation guide](https://youtu.be/Ldbd94HM8hg?si=YSJAtWxdds9Tr3dq)
Mayhem has the following dependencies which must be installed for the mod to work:
* [Steamodded](https://github.com/Steamodded/smods)
* [Amulet](https://github.com/frostice482/Amulet)
* [Noituus](https://codeberg.org/alex343xd/Noituus)

All of the dependencies on the latest (supported) versions are included in the Dependencies ZIP on every Mayhem release.

Mayhem may conflict with certain content mods. Most popular mods should work, but more obscure and rough mods may cause issues. Cryptid in particular is **NOT** officially supported.

If your game crashes with an error along the lines of ``attempt to index a nil value ("may")``, Mayhem was not able to load, usually due to incorrect/missing dependencies. 

# Recommended Mods
Mayhem releases come with a Recommended Mods ZIP which has a plethora of smaller mods that work excellently with Mayhem. These are obviously optional, but they make the experience feel more complete. 

Mods marked with (CM) enable additional content from Mayhem when used.

### QoL
* Handy: General QoL mod that allows you to swipe to select cards, increase the game speed to really high amounts and mass destroy Tags and Consumables in case of emergency
* Cartomancer: Miscellaneous QoL mod that mainly allows you to zoom in or hide your Jokers and Consumables, improves hand card sorting, limit Chip/Mult flames and your deck size
* Galdur: Overhauls the New Run tab to make it more efficient and pleasing when you have a lot of Decks and Stakes 
* Spotlight: Highlights card area changes, like Joker/Consumable Slot and Hand Size increases
* Banner: Allows you to disable individual pieces of content
* BetterTags: Makes identical Tags only display themselves once, stacking them like Noituus, however their order is still preserved
* BetterIllusion: Fixes the Illusion Voucher, allowing cards in the shop to appear with Seals
* DebugPlus: While intended for mod developers, it is still handy for showing your FPS and allowing you to cheat in cards if you just want to mess around
* Blueprint: Makes the Blueprint and Brainstorm Jokers display the Joker they're copying
* Next Ante Preview: Shows a preview of the Blinds in the next Ante at the cash out screen after defeating a Boss Blind
* Frost's Utils: Optimization and speed utilities 
* UnBlind: Shows a preview of the current ante in the shop instead of the usual Shop sign
* Main Menu Tweaks: Changes the buttons on the main menu, grouping the Options and Mods buttons together
* Lua Patcher: Prevents most crashes
### Content
* Grim (CM): Adds a per-run skill tree with classes that enable specific content
* Engulf (CM): Allows Planet Cards to appear with Editions which are applied to the Poker Hands they affect
* Fitxes: Adds Token consumables which give Tags when used
* Espazio (CM): Adds Blank Consumables which turn into the next consumable of their type that's used while held
* Spectrum API: Adds the Spectrum hand type, which contains 5 different suits at once
* Card Sleeves (CM): Adds Sleeves which are equipped on top of decks, analogous to existing decks (eg Yellow Sleeve starts you out with an additional $10). Use the deck with its corresponding Sleeve to unlock a crazier new ability for your Sleeve...
* Finity: Adds Showdown Jokers corresponding to each Finisher Boss Blind, which are obtained after defeating them

# For content creators 
First of all, thank you. Second of all, here's some things you should keep in mind if you want to stream and/or make Mayhem content:
* Disable "White noise during Transcendence" in Mayhem's Effects tab. This setting disables the crazy static during high scores, which can absolutely obliterate your bitrate. 
* Enable "Tamer hyperoperation sounds" in Mayhem's Audio & SFX tab. This setting makes the absolutely crazy sounds that play with really high operations more controlled, as they get really earrape-y when layered. 
* Do NOT use the latest release of Slay the Jokers, as it is incompatible with Mayhem. Make sure to instead download the absolute latest commit. 
* If you've played Mayhem once a while back, you should delete your Mayhem config and start fresh to avoid freak bugs from huge version jumps (your config file is ``%AppData%/balatro/config/mayhem.jkr``). 
* Mayhem has custom save files, no need to back your saves up. 
* Minimal Screen Shake is recommended for Mayhem's effects (~25)
* Please add an epilepsy warning.

# Links
* [Credits](https://docs.google.com/document/d/1P53UrzO_xHavnu59BPmQSzwq0ZeTYD1dUHoRvsMqx9w/edit?usp=drivesdk)
* [Wiki](https://balatromods.miraheze.org/wiki/Mayhem)
* [Mayhem Docs](https://docs.google.com/document/d/1fxpHe9eeimEFgb8htmr9WFAyqFMfycXNf_Vwx-uh0e4/edit?usp=drivesdk) - Categorized list of EVERY* piece of Mayhem content, planned and implemented
* [XD Mods OST](https://drive.google.com/file/d/17VVFR3sCJLQNntId2h7nccj7hwmY50_U/view?usp=drivesdk) - Every song from Mayhem and my other mods, implemented or otherwise, labeled properly with bonus tracks, old versions of tracks and Transcendence ambiance

If you have any questions or problems, feel free to start a discussion thread on this repo or contact me on Discord (@alex343xd).

** **

![Nacho](https://codeberg.org/BalatroMayhem/Mayhem/raw/branch/main/repoassets/mrnacho.png)
Mr. Nacho awaits you.
