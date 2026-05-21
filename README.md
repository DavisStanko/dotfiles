# My Dotfiles

This repository contains my personal configuration files, also known as dotfiles. These files configure various programs that I use daily on my computer which runs Fedora Linux with the GNOME desktop environment.

## Table of Contents

- [Installation](#installation)
- [Theme](#theme)
- [Shell](#shell)
  - [zsh](#zsh)
  - [kitty](#kitty)
- [neovim](#neovim)
  - [`init.lua`](#initlua)
  - [`options.lua`](#optionslua)
  - [`plugins.lua`](#pluginslua)
  - [`keymaps.lua`](#keymapslua)
  - [`colorscheme.lua`](#colorschemelua)
  - [`lsp.lua`](#lsplua)
  - [`config/nvim-cmp.lua`](#confignvim-cmplua)
- [Media](#media)
  - [mpv](#mpv)
  - [mpd](#mpd)
  - [ncmpcpp](#ncmpcpp)
- [Neofetch](#neofetch)
- [Wallpapers](#wallpapers)
- [License](#license)

## Installation

**Warning**

_Blindly copying and pasting someone else's dotfiles can be dangerous. It is important to read and understand these configuration files before using them, and to modify them to suit your personal preferences and needs._

To use these dotfiles on your own system, you can simply copy the text from the desired file and paste it into your own. However, I recommend you only take the parts that interest you and modify the rest for your personal use.

## Theme

I use the Gruvbox color scheme across my setup. Every program I use is themed to match.

Gruvbox is a retro groove color scheme for Vim, terminal emulators, and other text-based applications. Its colors are available at [morhetz/gruvbox](https://github.com/morhetz/gruvbox).

## Shell

### zsh

I prefer to use zsh as my shell since it's more feature rich and modern, but my configuration files also work with bash. The configuration included in this repository includes a variety of useful features:

#### zsh specific features

- Syntax highlighting with [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- Better tab completion
- Vi mode

#### Shell agnostic features

- Useful aliases and functions (look in `.commonrc` to see them all)
- Auto ls after cd
- Informative prompt
- Home, end, and delete keys work properly

Most shell configuration lives in `.commonrc` so that it can be shared between bash and zsh. The `.zshrc` and `.bashrc` files are used to set features specific to each shell.

### kitty

kitty is one of the most feature rich terminal emulators available while also being lightweight. If you are looking for something with fewer features, I recommend alacritty.

The configuration included in this repository includes the following changes:

- Disabled the bell
- Disabled confirmation on quit
- Enabled background opacity

## neovim

neovim is just Vim but better. If you currently use Vim, your existing `init.vim` will work with neovim. There is no reason not to switch.

If you have never used Vim bindings before, you should look into them. They are the most efficient way to edit text. To get started, simply run `vimtutor`, an interactive tutorial that ships with Vim and neovim. If you would rather watch a video, I recommend [The Primeagen's](https://www.youtube.com/@ThePrimeagen) playlist [Vim As Your Editor](https://www.youtube.com/watch?v=X6AR2RMB5tE&list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R&pp=iAQB) on YouTube.

### `init.lua`

This file just imports the other configuration files.

### `options.lua`

This file configures the general options of neovim.

- Mouse support
- Use system clipboard
- 4 space tabs
- Convenient line wrapping
- Trailing white space removal on save
- Sane UI defaults
- Standard search options
- Plugin configuration

### `plugins.lua`

This file configures [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim), a plugin manager for neovim written in Lua. When `PackerSync` is run, the following plugins and their dependencies will be installed:

- Styling
  - [wittyjudge/gruvbox-material.nvim](https://github.com/wittyjudge/gruvbox-material.nvim)
  - [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
  - [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- Utilities
  - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
  - [ap/vim-css-color](https://github.com/ap/vim-css-color)
- NerdTree
  - [preservim/nerdtree](https://github.com/preservim/nerdtree)
  - [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- Live Previews
  - I use [charmbracelet/glow](https://github.com/charmbracelet/glow) to preview markdown files, but it is not a neovim plugin. It is a standalone program.
  - [barrett-ruth/live-server.nvim](https://github.com/barrett-ruth/live-server.nvim)
  - [lervag/vimtex](https://github.com/lervag/vimtex)
- Copilot, LSP, Autocompletion
  - [github/copilot.vim](https://github.com/github/copilot.vim)
  - [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)

### `keymaps.lua`

This file configures my custom keybindings and commands for neovim.

- Leader key is set to `space`
- Shortcut find and replace to `S`
- Toggle on spellcheck with `leader + o`
- Save with sudo with `:w!!`
- Toggle nerd tree with `leader + n`
- Open telescope with `leader + f`
- Open a vscode-like terminal with `leader + t`
- Standard split navigation and resizing shortcuts

### `colorscheme.lua`

This file sets the color scheme of neovim and vim-airline to Gruvbox.

### `lsp.lua`

This file sets up language server protocol support for neovim. LSPs need to be installed separately for each language using the `:LspInstall` command.

### `config/nvim-cmp.lua`

This file configures autocompletion and its hotkeys.

## Media

### mpv

mpv is better than VLC.

I've made the following changes to the default configuration:

- Start in windowed mode
- Display images indefinitely
- Automatically select English audio tracks and subtitles when available
- MPRIS support (media keys work)

### mpd

mpd is to music what mpv is to video. It is a powerful and lightweight music player daemon. mpd shouldn't be used directly, but rather with a client such as ncmpcpp.

My mpd configuration is very simple and only includes the location of songs and playlists along with audio visualization support.

#### mpDris2

mpDris2 is a MPRIS bridge for mpd. It allows mpd to be controlled by media keys.

### ncmpcpp

ncmpcpp is a music player client for mpd.

My configuration mostly boils down to Vim keybindings, minor cosmetic changes, and the removal of windows that I don't use.

## Neofetch

Neofetch shows your system information. It isn't necessary, but it looks cool.

The configuration included in this repository has been modified to include the display of the screen's refresh rate alongside the resolution in the output.

## Wallpapers

I have included a directory `.config/wallpapers` with wallpapers meant to complement the Gruvbox theme.

## License

This project is licensed under the [GPL-3.0](LICENSE.md)
GNU General Public License — see the [LICENSE.md](LICENSE.md) file for details.
