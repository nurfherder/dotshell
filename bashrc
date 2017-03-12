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
# Source in .shrc . This is the bulk of the
# configuration.
#------------------------------------------
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

if [ -f "$HOME/.shenv" ]; then
  . "$HOME/.shenv"
fi

export PS1="\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
