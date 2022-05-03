#!/usr/bin/zsh
#
#=================== session
# sway - labwc - shell - gnome - plasma
export SESSION="sway"
export SESSION_HOLD=0

#=================== wayland
export CLUTTER_BACKEND=wayland
export MOZ_DBUS_REMOTE=1
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

#=================== xdg
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_LIBRARY_HOME="$HOME/.local/lib"

#=================== defaults
export CALIBRE_USE_DARK_PALETTE=1
export EDITOR="nvim"
export GEDITOR="neovide"
export GTK_IM_MODULE=ibus
export LESS="-R --use-color -Dd+b"
export MANPAGER="less"
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

#=================== migrates
# config
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME/bash-completion/bash_completion"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export MAMBARC="$XDG_CONFIG_HOME/mambarc"
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
export R_PROFILE_USER="$XDG_CONFIG_HOME/R/.Rprofile"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"
# export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
# export TASKDATA="$XDG_CONFIG_HOME/task/"

# data
export ANDROID_HOME="$XDG_DATA_HOME/android/sdk"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export R_HISTFILE="$XDG_DATA_HOME/R/.Rhistory"
export R_HOME_USER="$XDG_DATA_HOME/R"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

# cache
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
[ ! -d $XDG_CACHE_HOME/keras ] && mkdir "$XDG_CACHE_HOME/keras"
[ ! -d $XDG_CACHE_HOME/wine-temp ] && mkdir "$XDG_CACHE_HOME/wine-temp"

# lib
export CARGO_HOME="$XDG_LIBRARY_HOME/cargo"
export MAMBA_ROOT_PREFIX="$XDG_LIBRARY_HOME/mamba";
export RUSTUP_HOME="$XDG_LIBRARY_HOME/rustup"
export R_LIBS_USER="$XDG_LIBRARY_HOME/R"

# other
export TFDS_DATA_DIR="$HOME/Analysis/datasets/tensorflow_datasets"
export WOBSOCK="$XDG_RUNTIME_DIR/wob.sock"
export SOVSOCK="$XDG_RUNTIME_DIR/sov.sock"

#=================== nnn
. $XDG_CONFIG_HOME/nnn/config

#=================== path
. $ZDOTDIR/.pathrc

#=================== keys
. $ZDOTDIR/.keyrc
