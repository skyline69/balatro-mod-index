# ZokersModMenu

A comprehensive customization mod for Balatro that allows you to modify starting conditions, build custom decks, select starting jokers and vouchers, and much more. Compatible with Mika's Mod Collection for expanded joker selection.

## Key Features

### 🎮 Core Customization
- **Starting Money**: Adjust your starting cash from $0 to $5000
- **Starting Hands**: Set hands per round (1-25)
- **Starting Discards**: Configure discards per round (0-25)
- **Hand Size**: Customize hand size from 1-50 cards
- **Hand Levels**: Set starting level for all poker hands (1-100)
- **Free Rerolls**: Toggle unlimited shop rerolls
- **Joker Slots**: Modify joker capacity (0-100)
- **Consumable Slots**: Adjust consumable capacity (0-15)

### 🃏 Advanced Deck Builder
- **Custom Deck Creation**: Build decks with up to 104 cards
- **Enhanced Cards**: Add enhancements (Bonus, Mult, Wild, Glass, Steel, Stone, Gold, Lucky)
- **Sealed Cards**: Apply seals (Gold, Red, Blue, Purple)
- **Card Editions**: Apply editions (Foil, Holographic, Polychrome)
- **Deck Management**: Save and load custom deck configurations
- **Proper Card Format**: Uses correct Balatro card IDs (H_2, S_A, etc.)

### 🎯 Give System
- **Give Items During Runs**: Enable/disable giving items while playing
- **Give Money**: Add $10, $50, $100, or $1000 instantly
- **Give Cards**: Create any playing card with custom properties
- **Give Jokers**: Instantly add any joker (vanilla or Mika's)
- **Give Consumables**: Add Tarot, Planet, or Spectral cards
- **Give Vouchers**: Apply any voucher effect immediately

### 🃏 Joker & Voucher Selection
- **Starting Jokers**: Choose up to **30 copies** of any joker
- **Starting Vouchers**: Select any vouchers to start with
- **Mika's Integration**: Automatic detection and support for Mika's Mod Collection jokers
- **Smart UI**: Color-coded selection and tabbed interface

## Installation & Usage

### Requirements
- **Steamodded**: Version 0.9.8 or higher (auto-installed via dependency)
- **Optional**: Mika's Mod Collection (for expanded joker selection)

### Controls
- **Press 'C'** anywhere in the game to toggle the menu (won't close other menus!)
- **Console Commands**: Full console integration for precise control (F7)
- **Hold Buttons**: Hold +/- for rapid value changes

### Menu Features
- **Non-Intrusive Toggle**: Fixed menu toggle that doesn't interfere with other game menus
- **Modern UI**: Clean interface with contemporary styling
- **Smart Card Placement**: Cards go to hand during rounds, deck when in shop
- **Persistent Storage**: Save deck configurations and settings

## Recent Updates (v1.4.8)

### Critical Bug Fixes
- **Menu Toggle Fixed**: Menu now properly toggles with 'C' key without interfering with other game menus
- **Card ID Format Fixed**: Updated all card creation to use correct Balatro format
- **Enhancement/Seal Cycling**: Fixed cycling functions to properly save and apply
- **Improved Card Giving**: Better logic for where cards are placed when given

### Technical Improvements
- Added comprehensive debug logging
- Enhanced UI stability with delays to prevent flickering
- Simplified key handling for more reliable behavior
- Consistent card ID formatting throughout

## Console Commands Examples

```lua
cs_money(100)          -- Set starting money to $100
cs_hands(8)            -- Set starting hands to 8
cs_hand_size(12)       -- Set hand size to 12 cards
cs_add_joker('credit_card')      -- Add Credit Card joker
cs_add_voucher('overstock_norm') -- Add Overstock voucher
cs_open()              -- Open the mod menu
```

## Compatibility

Fully compatible with Mika's Mod Collection and designed to work seamlessly with other Balatro mods. The mod includes automatic detection and integration features for enhanced compatibility.

---

*Customize your Balatro experience like never before! 🎲*