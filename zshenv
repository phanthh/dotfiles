#=========================== MONITORS ===========================#
export MON0="eDP-1"
export MON1="HDMI-1"

#=========================== XDG ====================================#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XAUTHORITY="$HOME/.Xauthority"

#=========================== BASIC DEFAULTS==========================#
export EDITOR="nvim"
export BROWSER="brave"
export VISUAL="nvim"
export TERMINAL="kitty"
export MYVIMRC="$HOME/.vimrc"
export QT_QPA_PLATFORMTHEME=qt5ct
export NO_AT_BRIDGE=1
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export FZF_DEFAULT_COMMAND=''
export CALIBRE_USE_DARK_PALETTE=1
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

#========================== MIGRATE CONFIG ==========================#
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

#========================== ANDROID VARIABLES ========================#
export ANDROID_HOME="$HOME/.android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

#========================== NNN CONFIG VARIABLES =====================#
export LC_COLLATE="C"
export NNN_OPTS="ceEx"
export NNN_COLORS="2136"
export NNN_TRASH=1
export NNN_BMS='b:~/.bin;d:~/Development;a:~/Academia;r:~/.repo;g:~/Drive;h:~;D:~/.dev;c:~/.config'

#============================== PATH =================================#
export LD_LIBRARY_PATH="/opt/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export PATH="${LD_LIBRARY_PATH}:/opt/cuda/bin:/opt/miniconda3/condabin::${CARGO_HOME}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

#============================== R PATH =================================#
export R_HOME_USER="$XDG_DATA_HOME/R"
export R_BROWSER="/usr/bin/$BROWSER"
export R_PROFILE_USER="$XDG_CONFIG_HOME/R/.Rprofile"
export R_LIBS_USER="$HOME/.local/lib/R"
export R_HISTFILE="$XDG_DATA_HOME/R/.Rhistory"

#============================== ZSH =================================# 
export ZDOTDIR="$HOME/.config/zsh"

