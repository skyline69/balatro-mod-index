# Balatro Spotify Connect

Multimedia integration and interactive player within Balatro. It allows you to control your music directly from the game via a draggable floating HUD. Initially compatible only with Spotify, it now supports YouTube Music and other operating system players (including browsers).

## Features

- Mini floating player on the HUD with real-time album art, title, artist, timer, and controls (pause, resume, previous, next).
- Fully draggable HUD with automatic persistence of position on screen.
- Cross-platform and multi-app support: works with Spotify, YouTube Music, Google Chrome, Microsoft Edge, and browsers via system multimedia APIs (Windows SMTC/WASAPI and Linux MPRIS).
- Source selector in settings to choose the specific application to control or leave it on automatic detection.
- Reactive audio effects: gentle volume attenuation when pausing the game or opening card packs (Booster Packs).
- Volume synchronization between the game and the active application.
- Muting of Balatro's native music when playing external audio, while preserving all sound effects.
- Full support for UTF-8 characters and CJK fonts (Japanese, kanji, accented characters).
- Configuration menu accessible via the F8 key or from the Steamodded mods menu.

## Technical Stack

- Lua (Steamodded and Lovely).
- Daemon Tools: Rust (Tokyo, Axum, Windows SMTC & WASAPI, Linux MPRIS).
- Communication: Asynchronous REST IPC using Love2D threads

## Contributions

If you wish to contribute improvements or create your own branch, you can do so from the repository:

https://github.com/eliiinyt/balatro-spotify-connect
