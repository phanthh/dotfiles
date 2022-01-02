#========================= history
HISTSIZE=1000000
SAVEHIST=10000000
[ ! -d ~/.cache/zsh ] && mkdir ~/.cache/zsh
HISTFILE=~/.cache/zsh/history

#========================= tmux
[ -x "$(command -v tmux)" ] && [ -z "${TMUX}" ] && { tmux attach || tmux; } >/dev/null 2>&1 

#========================= prompt
cl='%F{cyan}'
er='%F{red}'
re='%f'
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)
setopt prompt_subst
zstyle ':vcs_info:git:*' formats "$cl(%f%b%F{cyan})$re "
zstyle ':vcs_info:*' enable git
PROMPT="\$vcs_info_msg_0_"
PROMPT+="%B%(?.$cl.$er%?!)C:$re%b"
PROMPT+="%/%B%(?.$cl.$er)>$re%b "

if [[ $XDG_SESSION_TYPE != tty ]]; then
	echo "Arch Linux [$(uname -r)]\n(c) $(date +%Y) MIT License. All rights reserved.\n"
fi

#========================= plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh --cmd cd)"
source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" 
source "${XDG_CONFIG_HOME:-$HOME/.config}/funcrc" 

#========================= vim
# menu completion
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# vim style
bindkey -v
bindkey jj vi-cmd-mode
# export KEYTIMEOUT=1

# cursor
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

#======================= shortcuts 
bindkey '^F' autosuggest-accept
bindkey -s '^O' 'n^M'
bindkey -s '^N' 'newsboat^M'
bindkey '^H' backward-kill-word

#========================= CONDA ================================#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#     . "/opt/miniconda3/etc/profile.d/conda.sh"
# else
#     export PATH="/opt/miniconda3/bin:$PATH"
# fi

# <<< conda initialize <<<
