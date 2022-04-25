#==========================================
# bash_profile
# BASH specific configs run at logon only.
#
# You should only put configs in here that
# are both:
# 1) BASH specific
# 2) Only run when you login
#
# You should probably be adding your change
# to ~/.shrc or ~/.profile (if for login)
#==========================================


#------------------------------------------
# Source in basic POSIX profile
#------------------------------------------
if [ -f "${HOME}/.profile" ]; then
  . "$HOME/.profile"
fi

#------------------------------------------
# Source in bashrc for idempotent bash
# specific settings
#------------------------------------------
if [ -f "${HOME}/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
