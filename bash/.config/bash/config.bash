#enable VI-keybindings
set -o vi
set editing-mode vi
set show-mode-in-prompt On

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


alias ll='ls -lh'
alias screencast='recordmydesktop  --on-the-fly-encoding --delay=2'

export SHELL="/bin/bash"
if [ -z "$PROMPT_PREFIX" ]; then
  export PROMPT_PREFIX=""
fi

# write branch name into prompt
source "$HOME/.config/bash/git-prompt.sh"
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-*color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[1;33m\]${PROMPT_PREFIX}\[\033[00;32m\]\[\033[0;33m\]${PROMPT_PREFIX}\u@\h  \[\033[00;32m\]$(__git_ps1 "%s  ")\[\033[00;34m\]\w \[\033[00m\] '
  else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[1;33m\]${PROMPT_PREFIX}\[\033[00;32m\]\[\033[00;33m\]\u  \[\033[00;32m\]$(__git_ps1 "%s  ")\[\033[00;34m\]\w \[\033[00m\] '
  fi
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

