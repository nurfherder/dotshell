My Shell Configuration
======================

These are my shell configuration files.  My goal is to have a setup that works across dash, ksh, bash, & zsh, and that shares the maximum amount of config file.  Also I want it to work on Linux, OS X, AIX, and CygWin.

Files (roughly in order of importance):

* `shenv` - contains the bulk of the config and is written to be posix shell compliant
* `profile` - common posix shell compliant config that is only run on login
* `bashrc` - bash specific configs and settings
* `bash_profile` - bash specific configs that should only run on login
* `zshenv` - zsh speific configs and settings
* `zshrc` - zsh specific configs and settings for interactive shells
* `zprofile` - zsh specific configs that should only run on login

Add-ons:

 * FunToo Keychain -  this makes using ssh keys much easier.
 * RBenv - manages different version of ruby.  Needs to tweek path.
 * Source in site specific settings from `$HOME/.shenv.site` if present.
 * My own statically compiled binaries - I want to set the path to these based on OS and architecture.  `${HOME}/bin/$(uname -s)_$(uname -m)/`

Deploy:
-------

**Prerequisites:**

 * git
 * linkme.sh
 * keychain (_optional_)
 * rbenv (_optional_)

**Procedure:**

Clone repo to your home directory:

    git clone git://github.com/nurfherder/dotshell.git ~/code/dot/dotshell

Create symlinks to config files and fetch submodules:

    cd ~/code/dot/dotshell
    linkme.sh

How to determine which config(s) gets read:
-------------------------------------------

I put this together as a reference to figure out where to put what.  The '||' is an or that stops on first success. Anytime there is a variable listed you can assume it behaves like:

    if [ -n "VARIABLE" ]; then . "$VARIABLE"; fi

###Dash or Ksh

**Login:** Read `/etc/profile`, then `~/.profile`

**Non-login interactive:** Read `$ENV`.


###Csh

**Login:** Read `/etc/csh.cshrc`, then `/etc/csh.login`, then (`~/.tcshrc` || `~/.cshrc`), then (`${histfile}` ||`~/.history`), then `~/.login`, and finally (`${dirsfile}` || `~/.cshdirs`).

**Non-login Interactive:** Read `/etc/csh.cshrc`, then (`~/.tcshrc` || `~/.cshrc`).


###Bash

**Login:** Read `/etc/profile`, then (`~/.bash_profile` || `~/.bash_login` || `~/.profile`).

**Non-login interactive:** Read `~/.bashrc`.

**Non-interactive:** Read `$BASH_ENV`.

**If invoked as /bin/sh:** Read `/etc/profile`, then `~/.profile`.


###Zsh

**Always:** Read `/etc/zshenv`, then `${ZDOTDIR}/.zshenv`.

**Login:** Do always section, then read `/etc/zprofile`, then `$ZDOTDIR/.zprofile`, then `/etc/zshrc`, then `$ZDOTDIR/.zshrc`, then `/etc/zlogin`, then `$ZDOTDIR/.zlogin`.

**Non-login interactive:** Do always section, then read `/etc/zshrc`, then `$ZDOTDIR/.zshrc`.

**Non-interactive:** Do always section.

**If invoked as /bin/sh:** Read `/etc/profile`, then `~/.profile`.
