# nvim_lua_config

Lua files and pre-setup for those who want to use Neovim with intelisense via LSPs and Luasnip

# Folder Structure:
> - lua/
> - - user/
> - - - lsp/
> - - - - handlers.lua
> - - - - init.lua
> - - - - lsp-installer.lua
> - - - colourscheme.lua
> - - - keymaps.lua
> - - - lspinstall.lua
> - - - lualine.lua
> - - - nvimcmp.lua
> - - - options.lua
> - - - plugins.lua
> - - plugin/  
> - - - packer_compiled.lua 
> - README.md  
> - init.lua  
> - init.vim1 (this is a fallback and is renamed accordingly) 
> - nvim_font.ttf

When using NeoVim it looks at the ~/.config/nvim folder for either a init.lua or an init.vim file;
which then acts as the main configuration file with the languages Lua or Vimscript respectively. In this case Lua is far superior due to its
nature as a compiled language.

This project breaks from the convention of having the init.lua/init.vim be a massive file and uses external imports to make the individual scripts easier to understand.

## Files you will want to edit:
> - plugins.lua -> This file is where Packer will source packages from these are git calls in effect, so they have to SSH the gitlab:int.asv.uk
> - options.lua -> This file is where your normal Vim options would go like: smarttab, cmdheight, etc
> - keymaps.kua -> This file is where any custom keybinds would go except for those related to intelisense/error detection
> - handlers.lua -> This file is where intellisense / error checking options and keybinds would go

# Default Keybinds
## Vanilla Keybinds
> Leader = \\  
> Ctrl + Z = Undo (A joke command that was added)
> Ctrl + H or Left Arrow = Switch Buffer Left
> Ctrl + L or Right Arrow = Switch Buffer Right
> Ctrl + Q = NERDTreeToggle (Open/Hide a NERDTree on The Left (Default))

## LSP Keybinds
> Leader + m = Open Popout Diagnostic (What is the error at the line the cursor is on)
> Tab = Indent an open Intellisense to select the correct item in that list 
> Space / Enter = Confirm Intellisense Selected

The Leader Key in Vi and its derivatives is a key which in command mode is used as a specific input like <leader> + q for a command input.

# Install Guide
```
$ sudo yum install lua
$ sudo yum install npm
$ sudo yum module install nodejs:16
$ python3 -m pip install pynvim --user
$ npm install -g neovim
```
> These are external packages that need to be installed via linux  

```
git clone --depth 1 git@gitlab.int.asvuk.com:mirror/neovim/packer.nvim.git
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
> Packer needs to be cloned to a specific place as well as being included in this repository

```
git clone --depth 1 git@gitlab.int.asvuk.com:adam.chu/nvim_lua_config.git
 ~/.config/nvim
```
> This repo needs to be cloned to a specific place

> Install the fonts provided from nvim_font.ttf (Containing a NotoSans Nerd Font (I use: `DejaVuSansMono Nerd Font Mono Book`))  
> Set this font as the terminal default (In Terminator it goes under Profiles) 

```
$ nvim
:PackerSync 
```
And it should work!
