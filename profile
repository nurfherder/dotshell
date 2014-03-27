#==========================================
# profile
# POSIX shell configs for initial login.
#
# You should only put configs in here that
# are:
# 1) run only at login
#
# You should probably be adding your change
# to ~/.shrc
#==========================================

# Set the file that loads for shells after login
ENV="$HOME/.shenv"; export ENV

#------------------------------------------
# Source in .shrc . This is the bulk of the
# configuration.
#------------------------------------------
if [ -f "$HOME/.shenv" ]; then
  . "$HOME/.shenv"
fi
