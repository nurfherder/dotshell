#==========================================
# bashrc
# BASH specific configs.
#
# You should only put configs in here that
# are:
# 1) BASH specific
#
# You should probably be adding your change
# to ~/.shrc
#==========================================


#------------------------------------------
# Source in .shenv. This is the bulk of the
# configuration.
#------------------------------------------
if [ -f "$HOME/.shenv" ]; then
  . "$HOME/.shenv"
fi

if [ $(uname -s) = 'Darwin' ]; then
  # Stop suggesting zsh
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi

if [ -f "$HOME/.bash/git-aware-prompt/main.sh" ]; then
  export GITAWAREPROMPT=~/.bash/git-aware-prompt
  . "${GITAWAREPROMPT}/main.sh"
  export PS1="\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
fi
