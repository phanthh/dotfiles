#========================= HISTORY =============================#

HISTSIZE=10000000
SAVEHIST=10000000
[ ! -d ~/.cache/zsh ] && mkdir ~/.cache/zsh
HISTFILE=~/.cache/zsh/history

#======================= AUTOSTART TMUX ========================#

if command -v tmux >/dev/null 2>&1; then
    [ -z "${TMUX}" ] && (tmux attach >/dev/null 2>&1 || tmux)
fi

#======================= OHMYZSH ===============================#

export ZSH="$HOME/.local/share/oh-my-zsh"

# kardan
ZSH_THEME="windows"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

#======================= ALIASES ===============================#

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/funcrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/funcrc"

#======================= PRIVATE ===============================# 
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/keyrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/keyrc"

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


#======================= SHORTCUTS ==============================#

bindkey '^F' autosuggest-accept
bindkey -s '^O' 'n^M'
bindkey -s '^P' 'ff ^M'
bindkey -s '^N' 'newsboat ^M'
bindkey -s '^K' 'vit ^M'

#======================= MINICONDA ==============================#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/opt/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="/opt/miniconda3/bin:$PATH"
fi

# <<< conda initialize <<<

#======================= START PROMPT ============================#
echo "Microsoft Windows [Version 10.0.18041.264]\n(c) 2020 Microsoft Corporation. All rights reserved.\n"

echo "Here are your tasks for today: "
task
