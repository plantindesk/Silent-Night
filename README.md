
# Silent Night 1.69

A Lua script for Grand Theft Auto V that provides various mod menus for manipulating heist payouts, managing businesses, unlocking content, and more.

## Features

* **Heist Editor:**
  * Agency Contract manipulation.
  * Autoshop Contract and payout settings.
  * Salvage Yard vehicle cost and prep manipulation.
  * Doomsday Heist act selection, cut settings, and prep manipulation.
  * Cayo Perico Heist target selection, difficulty, approach, weapon loadout, cut settings, and extras like bypasses for specific objectives.
  * Apartment Heist prep manipulation, cut settings, and extras.
* **Money Tool:**
  * Bunker supply manipulation and instant sell.
  * MC Business resupply and production/sale price manipulation.
  * Hangar Cargo supply manipulation, custom pricing, and instant sell.
  * Nightclub popularity/safe manipulation, cargo value settings, and cooldown bypass.
  * Special Cargo supply manipulation, instant sell, and cooldown bypass.
* **Miscellaneous:**
  * Stat Editor for setting RP level.
  * Vehicle Utilities for manipulating top speed and acceleration.
  * Unlocker Menu for various items like parachutes, tattoos, outfits, medals, and liveries.
  * LSCM Unlocker for reputation levels, trade prices, and prize ride.
  * Gun Van Menu for teleporting the van, customizing its inventory, and unlocking content.

## Installation

1. Ensure you have a Lua scripting platform for GTA V installed (e.g., Stand).
2. Download the `Silent-Night.lua` file.
3. Place the script file in your script platform's scripts directory.

## Usage

1. Launch GTA V and load into Online mode.
2. Inject/run the `Yimmenu.dll` using Xenos injector
3. Open Yimmenu and go to Settings>Lua Script and Enable `Silent-Night.lua` and `Silent-data.lua`.
4. Access the mod menu through the in-game menu.

## Code Structure

The code is organized with global variables defining memory addresses and functions for specific tasks. The menu structure is created using a hierarchy of tabs and elements for user interaction.

### Key Functions

* `MPX()`: Determines and returns the appropriate multiplayer prefix string ("MP0_" or "MP1_") based on the player's last character slot.
* `MoneyFormatter(n)`: Formats a number `n` into a string with comma separators.
* `stats_set_packed_bool(packed_bool, bool)`: Sets a specific bit within a packed boolean stat.
* `globals_set_ints(global_start, global_finish, step, value)`: Sets a range of global variables to a specific integer value.
* `CutsPresetter(global_start, global_finish, cut)`: Sets heist cut percentages for a range of players.

## Dependencies

* `Silent-data`: This appears to be a separate Lua file (not included here) that likely contains data structures and functions related to the "Silent Night" menu.

## Credits

- Developer: SilentSalo

### Helpers

- gaymer
- Big Smoke
- Slon
- CasinoPacino
- Bababoiiiii
- Amnesia
- jschaotic
- Killa`B
- Mr. Robot
- L7NEG
- LUKY6464
- ShinyWasabi
- gir489returns
- Unkn0wnXit
- Zeiger
- Pewpew
- ObratniyVasya
- CheatChris
- Rostal
- VodisAreThere65715
- Yimura
- Loled69
- Alestarov
- TheKuter
- RazorGamerX
- USBMenus

## Notes

* This Lua can only be used in Yim Menu

## Disclaimer

This script is provided for educational and entertainment purposes only. Use it at your own risk. The developers of this script are not responsible for any consequences resulting from its use.

## Licensing

* This project is licensed under the **GNU General Public License v3 (GPLv3)**. You are free to copy, modify, and distribute this software as long as you comply with the terms of the license, which can be found in the [LICENSE](LICENSE) file.
* GPLv3 conditions include:
  * Freedom to use, modify, and distribute the software.
  * Source code must be made available when distributing modified versions.
        Changes made to the software must be licensed under GPLv3.
