## Information
> This script is more complex to set up than the original. Try to follow along with the different portions of the setup process to ensure you have done it correctly. Use the readout in the statusbar of the scripts GUI to see whats going on with the script. Enable debug messages with Logic or Location to see the information as a tooltip in the top left corner.

> This script is written in [**AutoHotKey**](https://www.autohotkey.com/), and will require the [**latest version of AHK**](https://www.autohotkey.com/download/ahk-install.exe) installed to use the script. Because it is written in AutoHotKey it is also portable, so it can be run from mostly any folder. 

> It is highly recommended from a safety standpoint that you follow the instructions [**here for basic info**](https://www.ownedcore.com/forums/mmo/path-of-exile/poe-bots-programs/676345-run-poe-limited-user.html) and [**here for steam and additional info**](https://www.ownedcore.com/forums/mmo/path-of-exile/poe-bots-programs/676345-run-poe-limited-user-13.html#post4065928) to set up the game to run as a limited user, then block the limited user from acessing the folder this script is located in.

> If you have not already, here is a link to download the [**Latest Base Release**](https://github.com/BanditTech/WingmanReloaded/releases/latest)

## In-Game Requirements

> The script requires a few things set up In-Game to work.
* Local chat MUST be enabled.
* Display must be set to Windowed Fullscreen
* For most things related to item parsing you must use english client.
  * The location system should work for any language client though
* Enable the Overhead Health Bar in game, so the script knows when to pause.
* Make sure the chat window text does not overlap inventory while stash is open

   

## Choose Aspect Ratio

> Determine the aspect ratio of your game resolution. Use [**Aspect Ratio Calulator**](https://andrew.hedges.name/experiments/aspect_ratio/) to determine which aspect ratio to choose. 

> The aspect ratio is a fraction based on the height and width of your screen

* When the game is running, pressing Get Ratio will show a messagebox with a matching aspect ratio
* Mouse over the dropdown box to see the list of available aspect ratio
* If your aspect ratio is not matching with one of the ones within the script, you will need to use the link above to determine which is the closest ratio to your own.

   

## Client.txt file location

> You must locate the Client.txt file that will be used for the script
* This file is required in order to determine the current location
* Default file location is configured as C:\ drive in a steam library
* If not found you will see a warning message, Simply locate your file in your PoE install folder
* Double check that you have local chat enabled In-Game, and it should now update when you zone change

   

## Configure Hotkeys

> Mandatory In-Game hotkeys are required for the script to function properly:
* Close-UI
* Inventory
* Weapon-Swap
* Item Pickup

> Optional hotkeys enable or disable script functions: (To disable leave blank)
* Open the Main Menu (defaults to Alt-F10 if blank)
* Auto-Flask toggle
* Auto-Quit toggle
* Logout
* Auto-Quicksilver toggle
* Coord/Pixel
* Quick-Portal
* Gem-Swap
* Pop Flasks
* ID/Vend/Stash
* Item Info

> Find more information about these hotkey functions in the [**GUI Documentation**](documentation)

## Calibrate Gamestates

> Several bits of information that the script is gathering are based on single pixel locations. When the pixel matches the previously sampled color, it will determine that the specific gamestate is active. This is important for knowing when your on your character and ready to play, or have panels open, are at the stash, etc... 
* There are two primary methods of performing the calibrations.
* The simplest for newer players is probably the Wizard.
  * It allows you to select several samples to do at once.
  * It will prompt you with what to do for each step.
* Individual Sample is the other method, and its easier when you only want to recalibrate one or two Gamestates.
  * Mouse over each button to see a discription.
  * Click the appropriate sample button while the Gamestate is active, read the popup and continue.

> Once you have done your calibrations, look at your Gamestates in the Main tab to confirm everything is working. When changing game panels the corresponding Gamestate should light up. If everything has lit up green the script is ready to work.

   

## Adjust Globes

> Use the Adjust Globes GUI to change where the script scans the screen for determining the Life, Energy Shield and Mana percentages.
* Adjust the area to change where it will scan the screenshot
* Change the "Base Color" to match against
* Change the variance from the base color it will consider matching
* Use the coord tool to capture an average color to use
* Avoid averaging the entire area, instead average the colors of a strip within the area that has little variance.

> All changes will occur in real time, but all changes will revert when the script resets unless you save to file.

> Try to avoid matching with the globe frame itself, this will cause it to not change percentage with your health.
   

## Assign Scroll Locations

> In order to properly use the inventory functions, you need to have portal and Identify scrolls in fixed position of your inventory.
* Go to Configuration Tab > Inventory > Scroll and Gem Locations
* Click Locate button for Portal then Wisdom scrolls
  * Press the Control button when you are directly in the center of each scroll.

   

## Assign Gem Locations

> In order to properly use the Gem-Swap function, you need to have two locations set to swap
* Go to Per Character Settings > First/Second Swap
* Click Locate button for position A and B
  * Press the Control button when you are directly in the center of each Gem/Item.
* Check Use as Item Swap if the first item to click is within your inventory, or an item on your character.
* Check Swap Weapon for B if you want to weapon swap before switching with position B
* First Swap will happen, then second depending on if there is a location assigned
  * To disable either swap, put 0 into the location editboxes

   

## Assign Stash Tabs

> In order to properly use the Inventory function to sort to stash tabs, you need to assign the number for each tab that matches the ingame list. From the top of the dropdown list for your stash tabs is position 1 going down to position 32.
* Go to Configuration Tab > Inventory > Stash Tabs > Stash Tab Management
* Select the assigned tab from the dropdown list
  * You can assign multiple types to the same stash tab
* Check the box to enable or disable stashing that type of item

## Affinity

> The script supports all type of affinity. In order to use them, drag the slider to the right, and it will display "Enable Affinity"

> Setting the slider to the middle, will allow you to manually select a tab without using affinity system

> Setting the slider to the left, will disable that type of item from being stashed by the script.

* Items with affinity enabled will not change the tab position when stashing
* CLF entries, and other settings in the Stash Tab Management will override Affinity where there is overlap
* Unique items are given special options which allow for filtering low rolled affixes
  * Assign a value to Minimum Affix Percentage, and Check the box above it to enable this
  * Affixes on the item will be evaluated against their maximum range, and given a percentage based on that.
  * Unique Rings can be stashed in their own tab when they overflow from the Affinity
  * The same for ALL uniques by enabling Unique Dump overflow
  * Check the box Including Junk to also stash uniques that are below your set affix % if it is enabled
    * The recommended combination is Unique Ring: Stash Overflow and Junk, Unique Dump: Stash Overflow only

## Activating Functions

> The script functions can now be enabled from within the Main tab of the GUI.

* The main four functions of the script will display in the Active Functions section
* When disabled, they will be gray. When enabled, they light up green
* To toggle any of these main functions, click on its label
* These can also be Toggled using a hotkey, which is assigned in the Hotkeys tab of the GUI