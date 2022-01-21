#!/usr/bin/zsh
#=================== session
# sway - shell - gnome
export SESSION="sway"

#=================== wayland 
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export JAVA_FONTS=/usr/share/fonts/TTF

export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export SDL_VIDEODRIVER=wayland

#=================== xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

#=================== defaults
export EDITOR="nvim"
export GEDITOR="neovide"
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
# export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
# export TASKDATA="$XDG_CONFIG_HOME/task/"
export CALIBRE_USE_DARK_PALETTE=1
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_COLLATE=C
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

#=================== migrate
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME/bash-completion/bash_completion"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
export YTFZF_CONFIG_DIR="$XDG_CONFIG_HOME/ytfzf"
export YTFZF_CONFIG_FILE="$YTFZF_CONFIG_DIR/conf.sh"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export TFDS_DATA_DIR="$HOME/Analysis/datasets/tensorflow_datasets"

#=================== secrets


#=================== android
export ANDROID_HOME="$HOME/.android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

#=================== configs
. $XDG_CONFIG_HOME/nnn/config

export R_HOME_USER="$XDG_DATA_HOME/R"
export R_PROFILE_USER="$XDG_CONFIG_HOME/R/.Rprofile"
export R_LIBS_USER="$HOME/.local/lib/R"
export R_HISTFILE="$XDG_DATA_HOME/R/.Rhistory"

#=================== path
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$XDG_DATA_HOME/solana/install/active_release/bin"
export PATH="$HOME/.local/bin:$HOME/.sh:$PATH"

#=================== zsh
export ZDOTDIR="$HOME/.config/zsh"
. $ZDOTDIR/.keyrc
