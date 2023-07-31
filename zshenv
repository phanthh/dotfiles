#!/usr/bin/zsh

#=================== defaults
export EDITOR="nvim"
export LESS="-R --use-color -Dd+b"
export MANPAGER="less"

#=================== nnn
# . $XDG_CONFIG_HOME/nnn/config

export ZDOTDIR="$HOME/.config/zsh/"

export PNPM_HOME="/Users/phanthh/Library/pnpm"
export JAVA_HOME="/opt/homebrew/opt/openjdk"
export PYENV_ROOT="$HOME/.pyenv"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


#=================== path
. $ZDOTDIR/.pathrc

#=================== keys
. $ZDOTDIR/.keyrc
. "$HOME/.cargo/env"
