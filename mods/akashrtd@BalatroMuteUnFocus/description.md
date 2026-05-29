# BalatroMuteUnFocus

A lightweight Balatro mod that mutes all audio when the game window loses focus and restores it when you switch back.

## Features

- Mutes audio on alt-tab / focus loss
- Restores previous volume on focus regain
- Zero configuration — install and play
- No Steamodded dependency — works with Lovely only
- Compatible with all other mods

## Requirements

- [Lovely](https://github.com/ethangreen-dev/lovely-injector) (mod loader)

## Installation

### With Balatro Mod Manager (BMM)

Search for "BalatroMuteUnFocus" and click Install.

### Manual

1. Download the latest release
2. Extract into your Mods directory:
   - **macOS:** `~/Library/Application Support/Balatro/Mods/`
   - **Windows:** `%AppData%/Balatro/Mods/`
   - **Linux:** `~/.local/share/Balatro/Mods/`
3. Launch Balatro

## How It Works

Uses Lovely to inject a `love.focus(f)` callback into Balatro's `main.lua` that calls `love.audio.setVolume(0)` on focus loss and restores the saved volume on focus regain.

## Uninstalling

Delete the `BalatroMuteUnFocus` folder from your Mods directory.

## License

[MIT](https://github.com/akashrtd/BalatroMuteUnFocus/blob/main/LICENSE)
