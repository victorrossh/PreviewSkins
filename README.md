# AMXX Plugins for Counter-Strike Server

This repository contains several AMXX plugins designed for a Counter-Strike server. These plugins add various models and skins to the game through an interactive menu system. Each plugin allows players to preview items via HTML MOTD windows, displaying the selected skin or model in-game.

## Features

- **Butchers Skins Preview** (`MOTD Butchers`)
- **Knifes Skins Preview** (`MOTD Knifes`)
- **CT Players Models Preview** (`MOTD Players CT`)
- **T Players Models Preview** (`MOTD Players TR`)
- **Main Preview Menu** that allows players to navigate between different preview categories (butchers, knives, players).

## Installation

1. Download or clone this repository to your local machine.
2. Place the plugin `.amxx` files into the `plugins` directory of your AMXX installation.
3. Add the plugin names to the `plugins.ini` file located in the `amxmodx/configs` directory.
4. Copy the `preview` folder, which contains the HTML preview files, into the `cstrike` folder of your server.

   - The directory structure should look like this:
     ```bash
     cstrike/
     └── preview/
         ├── b_blackwolf.html
         ├── b_rainbow.html
         ├── k_abstract.html
         ├── ct_anonymous.html
         ├── t_joker.html
         └── (other HTML files)
     ```

5. **HTML File Names**: The names of the HTML files to be displayed in-game are defined directly in the plugin `.sma` code. Each skin/model is represented by two values in an array:
   - The first value is the name that will appear in the menu.
   - The second value is the name of the HTML file that should be inside the `preview` folder.

   Example from the `.sma` code:
   ```sma
   {"Anonymous", "ct_anonymous"},

### Example

In the code:

- `"Anonymous"` is the name that will appear in the game menu.
- `ct_anonymous` is the name of the HTML file (`ct_anonymous.html`) that will be located in `cstrike/preview/`.

Make sure the HTML files match the second value in the array within the plugin, in this case referring to `ct_anonymous`.

## How to Use

After installing the plugins, you can use the following commands in-game to access the preview menus:

- `/pbut` - Opens the Butchers skins preview menu.
- `/pknife` - Opens the Knifes skins preview menu.
- `/pmodels_ct` - Opens the CT Player models preview menu.
- `/pmodels_tr` - Opens the TR Player models preview menu.
- `/preview` - Opens the main preview menu, allowing navigation between Butchers, Knifes, and Player models.

## How It Works

Each plugin dynamically loads preview files from the `cstrike/preview` directory. The `%s` placeholders in the plugin code will automatically fetch and display the corresponding HTML file for the selected item. For example:

- When a player selects "Black Wolf" in the Butchers menu, the plugin will load `cstrike/preview/b_blackwolf.html` in the MOTD window.
- Similarly, selecting "Abstract" in the Knifes menu will load `cstrike/preview/k_abstract.html`.

## Authors

- **ftl~**
- **WESPEOOTY**
