# Instructions
These instructions assume you are knowledgable enough to replicate and adjust what is already present to ensure the system continues to work as expected and to be used as a visual guide. If you are running into an issue you cannot figure out, feel free to [file an issue for assistance](https://github.com/Kalbintion/GMOD-Aides/issues/new), I will try to respond within 48 hours or less but will not guarantee these response times.

## File Location
Your servers workshop.lua file should be located within your gmod install under `garrysmod/lua/autorun/server`

If running windows, it could for example be found at: `C:\Garry's Mod Server\garrysmod\lua\autorun\server\workshop.lua`
If running a Linux flavor, it could for example be found at: `~/servers/gmod/garrysgmod/lua/autorun/server/workshop.lua`

## Notes
* Updating your [workshop.lua](workshop.lua) file for handling automated setup of workshop downloads can be done while your server is running.
* The [workshop.lua](workshop.lua) file offered here contains my personal collections used for TTT/2, Murder, Prophunters and Deathrun with all of their addon IDs.
* The workshop.lua file can be named anything, it is just named as such as its the most logical name for me.

## Collection Setup & Update Steps
  * Visit your collection and scroll to the bottom (this ensures all items in collection are loaded on page)
  * Copy/paste [raw code](https://raw.githubusercontent.com/Kalbintion/GMOD-Aides/main/lua/autorun/server/workshop.js) from [workshop.js](workshop.js)
  * Open up developer console (CTRL+SHIFT+I in Chrome/FF)
  * Paste and hit enter to run script
  * Right-click console output and select relevant browser specific copy menu item
    * Such as:
      * "Copy String Contents" (Chrome) **PREFERRED**
      * "Copy Message" (Firefox)
    * Example Output:
      * `"{1262875,1271857128,90126827,128578125,125782}"`
  * Open your server workshop.lua file
  * Paste & Overwrite collectionData list
    * Note: If you're using a browser other than Chrome using the copy method mentioned above, ensure the quotes at the start and end are not present
  * Save

## Different Gamemodes
If you are running multiple gamemodes from the same server machine that uses the same install location, and those are not included in the workshop.lua file provided, make the following additions:

* Just before the first `end` (Line 16 in the original file) type/copy+paste: `elseif ( engine.ActiveGamemode() == "GAMEMODE" ) then`
* Edit the word `GAMEMODE` mentioned above between the quotes (preserving the quotes) replacing it with your gamemode name. This is the same string used in your `+gamemode` command line argument
  * Don't know your gamemode and cant seem to find it? No worries, within the server console (either directly or via rcon) with the gamemode up, run the following: `lua_run print(engine.ActiveGamemode())` **Capitalization must match exactly**
* Press Enter then Tab
* Type or copy+paste the following: `collectionData = `
* Follow the above instructions from "Collection Setup & Update Steps" to obtain the collection's addon IDs and then paste
* Save
