# nvim_lua_config

Lua files and pre-setup for those who want to use Neovim with intelisense via LSPs and Luasnip

# Folder Structure:
> - lua/
> - - core/
> - - - autocmds.lua
> - - - init.lua
> - - - remaps.lua
> - - - sets.lua
> - - lazi.lua
> - - plugins/
> - - - fzf.lua
> - - - lspconfig.lua
> - - - mason.lua
> - - - snacks
> - - - tokyonight.lua
> - - - vim-gitgutter.lua
> - README.md  
> - init.lua  
> - nvim_font.ttf

When using NeoVim it looks at the ~/.config/nvim folder for either a init.lua or an init.vim file;
which then acts as the main configuration file with the languages Lua or Vimscript respectively. In this case Lua is far superior due to its
nature as a compiled language.

This project breaks from the convention of having the init.lua/init.vim be a massive file and uses external imports to make the individual scripts easier to understand.

## Files you will want to edit:
> - plugins/package_name.lua -> This file is where LazyVim will search for packages to install ontop of its baseset (or if you want to configure the existing ones)
> - core/sets.lua -> This file is where your normal Vim options would go like: smarttab, cmdheight
> - remaps/keymaps.lua -> This file is where any custom keybinds would go except for those related to intelisense/error detection
> - plugins/lspconfig.lua -> This file is where intellisense / error checking options and keybinds would go

# Default Keybinds
## Vanilla Keybinds
> Leader = \\  
> Ctrl + H or Left Arrow = Switch Buffer Left
> Ctrl + L or Right Arrow = Switch Buffer Right

## LSP Keybinds
> Leader + m = Open Popout Diagnostic (What is the error at the line the cursor is on)

The Leader Key in Vi and its derivatives is a key which in command mode is used as a specific input like <leader> + q for a command input.

# Install Guide
```
$ sudo pacman -S lua
$ sudo pacman -S  npm
$ sudo pacman -S nodejs
$ sudo pacman -S fzf
$ python3 -m pip install pynvim --user
$ npm install -g neovim
```
> These are external packages that need to be installed via linux  

git clone --depth 1 https://github.com/AChu-Dev/nvim-lua\
 ~/.config/nvim
```
> This repo needs to be cloned to a specific place

> Install the fonts provided from nvim_font.ttf (Containing a NotoSans Nerd Font (I use: `DejaVuSansMono Nerd Font Mono Book`))  
> Set this font as the terminal default (In Terminator it goes under Profiles) 

```
$ nvim
:Lazy 
```
And it should work!
