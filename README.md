# My Dotfiles

This repository contains my personal configuration files, also known as dotfiles. These files configure various programs that I use daily on my computer which runs Fedora Linux.

## Table of Contents

* [Syncing](#syncing)
* [Installation](#installation)
* [Shell](#shell)
  * [zsh](#zsh)
  * [bash](#bash)
  * [`.commonrc`](#commonrc)
  * [kitty](#kitty)
* [Editors](#editors)
  * [neovim](#neovim)
    * [`init.lua`](#initlua)
    * [`options.lua`](#optionslua)
    * [`plugins.lua`](#pluginslua)
    * [`keymaps.lua`](#keymapslua)
    * [`colorscheme.lua`](#colorschemelua)
    * [`lsp.lua`](#lsplua)
    * [`config/nvim-cmp.lua`](#confignvim-cmplua)
  * [VS Code / Cursor / Antigravity](#vs-code--cursor--antigravity)
* [Media](#media)
  * [mpv](#mpv)
  * [mpd](#mpd)
  * [ncmpcpp](#ncmpcpp)
* [Wallpapers](#wallpapers)
* [License](#license)


## Syncing

Two scripts are included to keep the repo in sync with the home directory:

- **`in`** — copies dotfiles from `~` into this repository.
- **`out`** — copies dotfiles from this repository into `~`.

Run either script from the repo root:

```bash
./in   # pull changes from your home dir into the repo
./out  # push changes from the repo into your home dir
```

Files not found at the source are skipped and reported. The scripts track the exact set of files listed in their `FILES` array.

## Installation

**Warning**

*Blindly copying and pasting someone else's dotfiles can be dangerous. It is important to read and understand these configuration files before using them, and to modify them to suit your personal preferences and needs.*

To use these dotfiles on your own system, you can simply copy paste the text from the desired file and paste it into your own. However, I recommend you only take the parts from mine that interest you and modify the rest for your personal use.

## Shell

### zsh

I prefer to use zsh as my shell since it's more feature rich and modern. The configuration included in this repository has been modified to include a variety of useful features, including:

#### zsh specific features
* Syntax highlighting with [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
* Better tab completion
* Vi mode with cursor shape changes per mode

#### Shell agnostic features
* Useful aliases and functions (look in `.commonrc` to see them all)
* Auto ls after cd
* Informative colored prompt
* Home, end, and delete keys work properly

Most shell configuration is in the `.commonrc` file so that it can be shared between bash and zsh. The `.zshrc` and `.bashrc` files are used to set features specific to each shell.

### bash

The `.bashrc` includes the shared `.commonrc`, sets a simple prompt, enables `autocd`, and implements auto-ls-after-cd via a `cd()` wrapper. `.bash_profile` sources `.bashrc` so the same config applies to login shells.

The `.bashrc` also includes optional [Kiro](https://kiro.aws/) shell integration when running inside a Kiro terminal session.

### `.commonrc`

This file is sourced by both `.zshrc` and `.bashrc` to share configuration between shells. It includes:

- **Defaults**: Sets `$EDITOR` to `code`, `$TERMINAL` to `alacritty`, and `$BROWSER` to `firefox`.
- **Safety aliases**: `cp`, `mv`, `rm` with verbose/prompt flags; `mkdir -pv` as `mkd`.
- **`ls` alias**: Human-readable, colorized, with directories listed first.
- **`backup()`**: rsync-based home directory backup to a mounted drive, excluding large/replaceable directories (`.cache`, `.wine`, browser profiles, etc.).
- **`yt` / `yta` aliases**: `yt-dlp` wrappers for downloading video and audio.
- **`sortsize` alias**: Sort subdirectories by disk usage.
- **`numfiles()`**: Count files per subdirectory, sorted descending.
- **`bt` alias**: Shorthand for `bluetoothctl`.
- **`vi()` function**: Opens `nvim .` if no arguments are given, otherwise passes arguments to `nvim`.
- **`playlist()`**: Generates `.m3u` playlist files for each subdirectory under `~/music/songs`.
- **`??` alias**: Shorthand for `gh copilot -i` (GitHub Copilot CLI).
- **Antigravity PTY block**: Sets `TERM=dumb` and a plain `PS1` when running inside an Antigravity agent session to prevent terminal control sequences from interfering.

### kitty

kitty is one of the most feature rich terminal emulators available while also being lightweight.

The configuration included in this repository has been modified to include a variety of useful features, including:

- Disabled the bell
- Disabled confirmation on quit
- Enabled background opacity

## Editors

### neovim

neovim is just Vim but better. If you currently use Vim your current `init.vim` will work with neovim. There is no reason not to switch.

If you have never used Vim bindings before, you should look into them. They are the most efficient way to edit text. If you are interested in learning Vim simply using Vimtutor which is a interactive text tutorial that comes with Vim and neovim. If you would rather watch a video, I recommend you watch [The Primeagen's](https://www.youtube.com/@ThePrimeagen) playlist [Vim As Your Editor](https://www.youtube.com/watch?v=X6AR2RMB5tE&list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R&pp=iAQB) on YouTube. This will teach you everything you need to know about Vim.

The configuration included in this repository has been modified to include a variety of useful features across multiple configuration files.

#### `init.lua`
This file just imports the other configuration files.

#### `options.lua`

This file configures the general options of neovim.

- Mouse support
- Use system clipboard
- 4 space tabs
- Convenient line wrapping
- Trailing white space removal on save
- Sane UI defaults
- Standard search options
- Plugin configuration

#### `plugins.lua`

This file configures [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) which is a plugin manager for neovim written in Lua. When `PackerSync` is run, the following plugins and their dependencies will be installed:

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


#### `keymaps.lua`

This file configures my custom keybindings and commands for neovim.

- Leader key is set to `space`
- Shortcut find and replace to `S`
- Toggle on spellcheck with `leader + o`
- Save with sudo with `:w!!`
- Toggle nerd tree with `leader + n`
- Open telescope with `leader + f`
- Open a vscode-like terminal with `leader + t`
- Standard split navigation and resizing shortcuts

#### `colorscheme.lua`

This file sets the color scheme of neovim and vim-airline to Gruvbox.

#### `lsp.lua`

This file sets up language server protocol support for neovim. LSPs need to be installed separately for each language using the `:LspInstall` command.

#### `config/nvim-cmp.lua`

This file configures autocompletion and its hotkeys.

### VS Code / Cursor / Antigravity

`settings.json` files for VS Code, Cursor, and Antigravity are tracked under their respective `.config/` directories. These share a common set of editor preferences.

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

### ncmpcpp

ncmpcpp is a music player client for mpd.

My configuration mostly boils down to Vim keybindings, minor cosmetic changes, and the removal of windows that I don't use.

## Wallpapers

I have included a directory `.config/wallpapers` with wallpapers.

## License

This project is licensed under the [GPL-3.0](LICENSE.md)
GNU General Public License - see the [LICENSE.md](LICENSE.md) file for details.
