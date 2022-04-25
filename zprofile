#==========================================
# zprofile
# zsh specific configs run at logon only.
# Run-once code.
#
# You should only put configs in here that
# are both:
# 1) zsh specific
# 2) Only run when you login
#
# You should probably be adding your change
# to ~/.shrc or ~/.profile (if for login)
#==========================================


#------------------------------------------
# Source in profile
#------------------------------------------
if [ -f "${HOME}/.profile" ]; then
  . "$HOME/.profile"
fi
