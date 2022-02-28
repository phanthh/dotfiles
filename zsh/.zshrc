#========================= history
HISTSIZE=1000000
SAVEHIST=1000000
[ ! -d ~/.cache/zsh ] && mkdir ~/.cache/zsh
HISTFILE=~/.cache/zsh/history

#========================= tmux
[ -x "$(command -v tmux)" ] && [ -z "${TMUX}" ] && { tmux attach || tmux; } >/dev/null 2>&1

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

#======================= mamba
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/usr/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/phanthh/.local/lib/mamba/";
__mamba_setup="$('/usr/bin/micromamba' shell hook --shell zsh --prefix '/home/phanthh/.local/lib/mamba/' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/phanthh/.local/lib/mamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/phanthh/.local/lib/mamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/phanthh/.local/lib/mamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

#======================= welcome
if [[ $XDG_SESSION_TYPE != tty && -z $DISTRO ]]; then
	echo "Arch Linux [$(uname -r)]\n(c) $(date +%Y) GNU GPL License. All rights reserved.\n"
fi

#========================= distros
DISTRO=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release | tr -d '"')
SYSTEM_ZSH_PLUGIN_PREFIX="/usr/share"
if [[ $DISTRO == 'arch' ]] || [[ $DISTRO == 'void' ]] ; then
  SYSTEM_ZSH_PLUGIN_PREFIX="/usr/share/zsh/plugins"
fi


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
[[ $DISTRO == 'arch' ]] && DISTROPROMPT='' || DISTROPROMPT="$cl@${DISTRO}$re"
RPROMPT="\$vcs_info_msg_0_"
PROMPT="%B%(?.$cl.$er%?!)C:$re%b"
PROMPT+="%/%B%(?.$cl.$er)${DISTROPROMPT}>$re%b "

#========================= plugins
[[ $DISTRO == 'gentoo']] && exit 0
source "${SYSTEM_ZSH_PLUGIN_PREFIX}/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${SYSTEM_ZSH_PLUGIN_PREFIX}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(zoxide init zsh --cmd cd)"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.aliasrc"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.funcrc"
