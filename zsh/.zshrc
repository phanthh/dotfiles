#========================= STARTUP =============================#
if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty && ! -z $SESSION ]]; then
  echo "Starting $SESSION session..."
  case $SESSION in
    sway) XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway sway ;;
    shell) XDG_SESSION_TYPE=shell $SHELL ;;
    terminal) XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway sway -c $XDG_CONFIG_HOME/sway/terminal ;;
    *) echo "Session $SESSION is invalid !" ;;
  esac 
	logout
	exit
fi

#========================= HISTORY =============================#
HISTSIZE=10000000
SAVEHIST=10000000
[ ! -d ~/.cache/zsh ] && mkdir ~/.cache/zsh
HISTFILE=~/.cache/zsh/history

#======================= AUTOSTART TMUX ========================#
[ -x "$(command -v tmux)" ] && [ -z "${TMUX}" ] && { tmux attach || tmux; } >/dev/null 2>&1

#======================= OHMYZSH ===============================#
export ZSH="$HOME/.local/share/oh-my-zsh"
# kardan
# windows
ZSH_THEME="windows"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

#======================= ZOXIDE ===============================#
eval "$(zoxide init zsh)"

#======================= ALIASES ===============================#
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" 
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/funcrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/funcrc" 

#======================= VIM KEYBIND ===========================#
# MENU COMPLETION
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# VIM STYLE EDITING
bindkey -v
bindkey jj vi-cmd-mode
# export KEYTIMEOUT=1

# VIM CURSOR
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
    zle -K viins 
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' 
preexec() { echo -ne '\e[5 q' ;} 

#==================== BACKSPACE DELETE ===========================#
bindkey '^H' backward-kill-word

#======================= SHORTCUTS ==============================#
bindkey '^F' autosuggest-accept
bindkey -s '^O' 'n^M'

#========================= CONDA ================================#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#     . "/opt/miniconda3/etc/profile.d/conda.sh"
# else
#     export PATH="/opt/miniconda3/bin:$PATH"
# fi

# <<< conda initialize <<<

#======================= START PROMPT ============================#

if [[ $XDG_SESSION_TYPE != tty ]]; then
	echo "Arch Linux [$(uname -r)]\n(c) $(date +%Y) Linux Foundation. All rights reserved.\n"
fi
