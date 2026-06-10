# ~/.zshrc

source ~/.commonrc

# zsh specific

# Enable colors, vcs, and change prompt:
autoload -U colors && colors	# Load colors

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments

# History:
HISTSIZE=500 # Current session's history
SAVEHIST=500 # History saved to file
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Define basic keys
# ***May differ between keyboards***
bindkey '^[[H' beginning-of-line        # Home
bindkey '^[[F' end-of-line      # End
bindkey '^[[3~' delete-char     # Delete

# auto ls after cd
function list_all() {
  emulate -L zsh
  ls
}
if [[ ${chpwd_functions[(r)list_all]} != "list_all" ]];then
  chpwd_functions=(${chpwd_functions[@]} "list_all")
fi

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# open pdfs and edit tex files
vilatex() {
    if [ -z "$1" ]; then
        echo "Usage: edittex <directory>"
        return 1
    fi

    directory=$1

    (find "$directory" -type f -name "*.pdf" -exec zathura {} +) & # Run zathura in the background
    find "$directory" -type f -name "*.tex" -exec nvim {} + # Run vim in the current terminal
}

# Link to syntax highlighting:
source ~/.config/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
