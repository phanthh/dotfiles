#========================= tmux
[[ -x "$(command -v tmux)" && -z ${TMUX} ]] && {
  tmux attach || tmux
} >/dev/null 2>&1

# [ -z "${NVIM_LISTEN_ADDRESS}" ] && nvim "term://$SHELL"
#========================= history
[[ ! -d ~/.cache/zsh ]] && mkdir ~/.cache/zsh
setopt SHARE_HISTORY
export NODE_NO_WARNINGS=1
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
bindkey -s '^O' 'f^M'

#========================= prompt
cl='%F{yellow}'
po='%F{green}'
er='%F{red}'
re='%f'
nl=$'\n'
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
PROMPT="$nl%B\$vcs_info_msg_0_%(?.$cl.$er%?!)@:$re"
PROMPT+="%~%(?.$cl.$er)${DISTROPROMPT}$nl>$re%b "

case "$(uname -s)" in
	Darwin*) OS='macos';;
	Linux*) OS='linux';;
	*) OS='';;
esac

# eval "$(starship init zsh)"
export MCFLY_RESULTS=50
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=2
eval "$(mcfly init zsh)"

#========================= plugins
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.aliasrc"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.funcrc"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.pkrc/macos"
source "$HOME/.repo/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.repo/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(zoxide init zsh --cmd cd)"
# eval "$(thefuck --alias f)"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11/"

#========================= pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

#======================= welcome
# [[ $XDG_SESSION_TYPE != tty ]] && {
#   echo "\n$(uname -s) [$(uname -r)]\n(c) $(date +%Y) Proprietary software License. All rights reserved.\n"
# }

# test -e "${ZDOTDIR}/.iterm3_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"

# bun completions
# [ -s "/Users/phanthh/.bun/_bun" ] && source "/Users/phanthh/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export SHARP_IGNORE_GLOBAL_LIBVIPS=1
