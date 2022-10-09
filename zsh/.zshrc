#========================= tmux
[[ -x "$(command -v tmux)" && -z ${TMUX} ]] && {
  tmux attach || tmux
} >/dev/null 2>&1

# [ -z "${NVIM_LISTEN_ADDRESS}" ] && nvim "term://$SHELL"

#========================= history
[[ ! -d ~/.cache/zsh ]] && mkdir ~/.cache/zsh
setopt SHARE_HISTORY
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE=~/.cache/zsh/history

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
bindkey '^H' backward-kill-word
bindkey -s '^O' 'n^M'

#========================= prompt
cl='%F{cyan}'
po='%F{green}'
er='%F{red}'
re='%f'
autoload -Uz vcs_info
setopt PROMPT_SUBST
precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "$er✗$re"
zstyle ':vcs_info:*' stagedstr "$po✓$re"
zstyle ':vcs_info:git:*' formats "$cl($re%b%u%c$cl)$re "
zstyle ':vcs_info:git:*' actionformats "$er($re%b%a%u%c$er)$re "
zstyle ':vcs_info:*' enable git
PROMPT="%B\$vcs_info_msg_0_%(?.$cl.$er%?!)C:$re"
PROMPT+="%/%(?.$cl.$er)${DISTROPROMPT}>$re%b "

#========================= plugins
source "$HOME/.repo/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.repo/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.aliasrc"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.funcrc"
# source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.pkrc/$DISTRO"
eval "$(zoxide init zsh --cmd cd)"
# eval "$(thefuck --alias f)"

#======================= welcome
# [[ $XDG_SESSION_TYPE != tty ]] && {
#   echo "\n$(uname -s) [$(uname -r)]\n(c) $(date +%Y) Proprietary software License. All rights reserved.\n"
# }
