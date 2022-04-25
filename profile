#==========================================
# profile
# POSIX shell configs for initial login.
#
# You should only put configs in here that
# are:
# 1) run only at login (or a new term created)
#
# Put path changes here otherwise
# You should probably be adding your change
# to ~/.shrc
#
# Use minimal Posix shell syntax here.
#==========================================


#-------------------------------------------
# Add site specific settings
#-------------------------------------------
if [ -f "$HOME/.profile.site" ]; then
  . "$HOME/.profile.site"
fi

#===========================================
# 1) Build PATH prefixes
#===========================================

#-------------------------------------------
# OS X: homebrew
# Get missing opensource software
#
# This needs to be nearly first in the path
# in order to override system binaries.
#-------------------------------------------
if [ $(uname -s) = 'Darwin' ]; then
  if [ -f '/usr/local/bin/brew' ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  elif [ -f "${HOME}/homebrew/bin/brew" ]; then
    eval "$($HOME/homebrew/bin/brew shellenv)"
  fi
fi


#-------------------------------------------
# Run my executables before homebrew and
# system binaries.
#
# Add arch independent executables to path.
#
# ~/bin
#
# Support homedir mounted on multiple archs
# and operating systems.
#
# ~/bin/exe-{OS}-{ARCH}/
#-------------------------------------------
PATH="$HOME/bin:$PATH";export PATH
MYEXES="$HOME/bin/exe-$(uname -s)-$(uname -m)"
if [ -d "$MYEXES" ]; then
  PATH="$MYEXES:$PATH"; export PATH
fi

#-------------------------------------------
# rbenv
#  Manage different versions of ruby.
#  See http://rbenv.org/
#
#  This needs to be first in the path, so add
#  this last.
#-------------------------------------------
if [ -d "$HOME/.rbenv/bin" ]; then
  PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  export PATH
  eval "$(rbenv init -)"
fi


#===========================================
# 2) Use SSH Agent if already running
#===========================================
#-------------------------------------------
# FunToo Keychain
#  Share ssh key between shell sessions.
#  See https://github.com/funtoo/keychain
#-------------------------------------------
if [ -f "$HOME/bin/keychain" ]; then
if [ $(uname -s) = 'Darwin' ]; then
  #The 'inherit any' gets passphrases in Apple MacOS Keychain
  eval `keychain --eval --agents ssh --inherit any id_rsa id_rsa.github id_ed25519.github`
else
  #Everything else runs this command:
  eval `keychain --eval --agents ssh id_rsa id_rsa.github`
fi
fi


# POSIX Shell
# ENV - If this variable is set, then parameter substitution is performed
# on the value to generate the path name of the script that will be executed
# when the shell is invoked. This file is typically used for alias and
# function definitions. This variable will be ignored for noninteractive shells.
#
# Note: bash, and zsh use *rc files automatically for this.

# Set the file that loads for shells after login
ENV="$HOME/.shenv"; export ENV

#------------------------------------------
# Source in .shrc if basic POSIX shell
#------------------------------------------
#if [ -f "$HOME/.shenv" -a  ! "${PARENT_PROFILE}" = 'true' ]; then
#  . "$HOME/.shenv"
#fi
