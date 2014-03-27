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
if [ -f "$HOME/.shenv" ]; then
  . "$HOME/.shenv"
fi
