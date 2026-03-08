# Balatro AP Mod

This is a Mod for [Balatro](https://store.steampowered.com/app/2379780/Balatro/) that provides Integration for [Archipelago Multi World](https://archipelago.gg).

This mod only works with the Steam version of Balatro

# Gameplay

After generating a seed, every joker, voucher, booster pack, consumable (spectral, tarot, planet) is locked. You can unlock them by finding them in the world as Archipelago items. 

Locations(Checks) are beating a boss blind at a specific ante with a specific deck at a specific stake. You can limit the amount of stakes and decks in the yaml. There are also buyable checks in the shop and special consumable items that are checks. 

There are bonus items, for example permanent bonus hand, permanent bonus starting money and more.
There are a few traps, for example lose one hand (for the current run), lose all money, make a random joker perishable and more. 

There are a lot more options, just check out the yaml that is bundled with the latest [release](https://github.com/BurndiL/BalatroAP/releases).

# Installation

Here's a [video tutorial](https://youtu.be/XnEvgEOswpk) I made sometime if any step of the installation is unclear.

You will need [Steamodded](https://github.com/Steamodded/smods/releases/latest). Follow their [installation guide](https://github.com/Steamodded/smods/wiki).

Your Balatro Folder should look something like this (the `version.dll` should be there):
![Your Balatro Folder should look something like this (highlighted files should be there)](https://i.imgur.com/Pe5uTX4.png).

## Installing the mod

To install the mod create a new folder in `%AppData%/Roaming/Balatro/Mods/` called `BalatroAP` and put the files from this repository in there. You can get those from `BalatroAP.zip` in the latest release. 

Your Mods folder should look something like this: 

![Mod Folder](https://i.imgur.com/EI6MGeC.png)

And the inside of the BalatroAP folder should look something like this:

![Your AppData Folder should look something like this](https://i.imgur.com/3JzrdlV.png).


You should be good to go then! You can start the game normally over Steam and it should load the mod. If there are any issues, consider going to the [Archipelago Discord](https://discord.gg/RwF6r5W6cY) server, there is a Balatro thread in future-game-design. 

## Connecting

In Balatro you can simply connect by selecting the profile "Archipelago" in the profile selector (bottom left in the main menu), then put in your connection info.
It is adviced that you backup your existing save files, even though they should not be modified or deleted by this mod. 

### Special Characters in Slot Name
If you encounter the issue that your slot name has a special character which cannot be entered in the connection textbox ingame, you can instead go to the Appdata folder and edit the file `APSettings.json` and type it in there.

## Linux using Proton via Steam

After installing Lovely you will need to edit your wine prefix to allow Lovely to load. This can be done any time after you place the `version.dll` file in your folder. Vanilla Balatro will always launch if you do not do this.

1. Download and install [Protontricks](https://github.com/Matoking/protontricks).
2. Open Protontricks.
3. If necessary, choose between Native and Flatpak Steam (I use flatpak for Balatro).

   ![image](https://github.com/user-attachments/assets/41d01b50-f541-408c-8ec4-229555c77b48)
   
5. Find and select Balatro.

   ![image](https://github.com/user-attachments/assets/c6471024-3d6d-447b-9793-a48c5591afc7)
   
   Note: If you receive an error, you may have to run the command `export PROTON_VERSION='Proton Experimental'` and restart Protontricks.
   
7. Select the default wineprefix and click OK.

   ![image](https://github.com/user-attachments/assets/671e06f1-20dd-4570-b03e-cd94bad8398a)
   
9. Select run winecfg and click OK.

   ![image](https://github.com/user-attachments/assets/b4ab95f8-6b55-4a54-9960-8dcf4c31a4eb)
   
11. Click the Libraries tab in the new popup.

    ![image](https://github.com/user-attachments/assets/2770f54b-00ec-4541-96ea-0aae087e5829)
   
13. Scroll in the existing overrides box and look for `version`.
14. If it is present, select it and click Edit... and make sure the option is set to Native then Builtin.

    ![image](https://github.com/user-attachments/assets/82ea030d-9bb9-476f-98d6-13eec172d027)
    
16. If it is not present, type it into the textbox for new overrides, then click Add.

    ![image](https://github.com/user-attachments/assets/b9a6244a-1c83-42e2-a243-a82006a46dc4)
    
18. Click OK to close this window.
19. Launch Balatro and Lovely should be working!