# BalatroAudioHotSwitch

Seamlessly switch audio devices while playing Balatro. Change your audio output (speakers to headphones, etc.) without restarting the game.

## Features

- **Instant Audio Device Switching**: Game audio automatically switches when you alt-tab back after changing your default audio device
- **No Audio Interruption**: Music continues playing on the new device
- **Zero Configuration**: Just install and play

## Requirements

- [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector) (installed automatically by mod manager)
- Windows, Linux, or macOS (*tested on Windows only*)

## Important: OpenAL Soft 1.22.0+ Required

This mod requires an updated OpenAL Soft library.

### Windows (Manual Step Required)
1. Download `OpenAL32.dll` from the [mod releases](https://github.com/robertbsmith/BalatroAudioHotSwitch/releases)
2. Copy it to your Balatro game folder (e.g., `C:\Program Files (x86)\Steam\steamapps\common\Balatro\`)
3. Replace the existing file (backup original if desired)

### Linux
Install via package manager: `sudo apt install libopenal1` (Debian/Ubuntu) or equivalent.

### macOS
Install via Homebrew: `brew install openal-soft`

The mod manager installs the Lovely patch automatically, but you must manually install the OpenAL library.

## How It Works

Uses OpenAL Soft's `alcReopenDeviceSOFT` function to seamlessly switch audio output when the game window regains focus. The stock Balatro OpenAL (v1.19.1) doesn't support this feature, which is why the updated library is required.
