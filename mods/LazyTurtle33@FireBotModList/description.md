This is a mod that will allow a firebot command to display your active mods.

# setup

## balatro

Make sure you have [Steamodded](https://github.com/Steamodded/smods) and [lovely](https://github.com/ethangreen-dev/lovely-injector) installed.
Add BalatroFireBotModList to your mods folder and launch the game.
You can test if it's working by opening a terminal and running:

```
 curl http://localhost:8080/mods
```

The output should have a "Content" area and your active mods should be there.
If you see your mods, then you're done on the Balatro side.

## FireBot

First, ensure that you have Firebot set up and working.
Next, go to commands and create a new custom command.
Make the trigger !mods or something similar.
Fill the description with something like "List active mods in Balatro when in game."
Switch to advanced mode.
Under restrictions, add a new restriction, select category/game, add it then search for Balatro.

Next, add a new effect.
Search for HTTP Request
Set the URL to "http://localhost:8080/mods" and the method to get.

(Optional) Add a run effect on error, search for Chat and add an error message.

Save the changes and add a new effect. search for chat and set the "message to send" to "$effectOutput[httpResponse]" and save

Everything is now done and ready for testing.
Go live, launch Balatro and run your command :3
