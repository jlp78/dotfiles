# -*- shell-script -*-
# .bashrc

# run only for interactive non-login shells

# commands here for all shells
# try to work around Ubuntu 12.04 XAUTHORITY settings
# are we on the console *and* running lightdm *and* root?
if [ `id -u` -eq 0 ]; then
  if [ "$XAUTHORITY" == "$HOME/.Xauthority" ]; then
    if [ "$DISPLAY" == ":0" ]; then
      x_cmd=`ps guaxww | grep /usr/bin/X | grep -v grep`
      case "$x_cmd" in
        *lightdm*)
          XAUTHORITY=`echo $x_cmd | sed -e 's/^.*-auth //' | awk '{print $1}'`
          export XAUTHORITY
          ;;
      esac
    fi
  fi
fi

oPATH="$PATH"

# figure out my current hostname
hostcmd=`type -path hostname || type -path uname || type -path uuname`
case $hostcmd in
  */uname*)
           HOST=`$hostcmd` -n
           ;;
  */hostname*)
           HOST=`$hostcmd`
           ;;
  */uuname*)
           HOST=`$hostcmd -l`
           ;;
  *)
           HOST="unknown"
           ;;
esac

# what kind of machine am I on?
if [ -f ~/.mach_type ]; then 
  source ~/.mach_type
else
  # some reasonable defaults
  MACH_TYPE=unknown
  X11=/usr/bin/X11
  LOCALBIN=/usr/local/bin
fi
# set up path stuff
if [ -d ~/bin/$MACH_TYPE ]; then
  MY_BIN=$HOME/bin/scripts:$HOME/bin/$MACH_TYPE
else
  MY_BIN=$HOME/bin/scripts
fi

MY_BIN=$MY_BIN:.:/usr/local/linkedin/bin:/export/apps/xtools/bin

# extra bin dirs
#EBIN=.:/usr/local/linkedin/bin

PATH=$MY_BIN:$LOCALBIN:$X11:/usr/ucb:/usr/bin:/bin:/usr/5bin
PATH=$PATH:/usr/etc:/etc:/usr/hosts:/usr/new:/usr/old:$EBIN:/usr/games

case $MACH_TYPE in
  mips)
        bsd_path=$PATH
        att_path=$MY_BIN:/bin:/usr/bin:$PATH
        ;;
  sun*)
        bsd_path=$PATH
        att_path=$MY_BIN:/usr/5bin:$PATH
        ;;
  *)
        bsd_path=$PATH
        att_path=$PATH
        ;;
esac

# don't allow group writes
#umask 022

# don't dump any cores (doesn't work on HP/UX?)
#ulimit -c 0

# env vars:
EDITOR=`type -path jove || type -path vi`
MORE=-c
LESS=qedm
PAGER=`type -path less || type -path more`
# special hacks for LESS
case $MACH_TYPE in
  linux)
    LESS="${LESS}X"
    ;;
esac
case $PAGER in
  *less)
    less_version=`$PAGER -V 2>&1 | sed -e 1q | awk '{print $NF}'`
    ;;
  *)
    less_version=unknown
    ;;
esac
case $less_version in
  332)
    LESS="${LESS}w"
    ;;
  340)
    LESS="${LESS}~"
    ;;
  *)
    LESS="${LESS}w"
    ;;
esac

NETHACKOPTIONS="DECgraphics,noconfirm,male,fixinv,nohelp,news,nonull"
NETHACKOPTIONS="${NETHACKOPTIONS},nopickup,norest_on_space,silent"
NETHACKOPTIONS="${NETHACKOPTIONS},sortpack,standout,time,noverbose"
NETHACKOPTIONS="${NETHACKOPTIONS},dogname:Spike,catname:Puff,fruit:mango"
REMOTE=~/.remote
XSHELL=`type -path bash`
KEYMAP=mips
PGPPATH=$HOME/.pgp
IMM_IMAGE_DIR=$HOME/lib/images
DISPLAY_GAMMA=2.2
FETCH_CMD="fetch -p"
PILOTRATE=38400
PILOTPORT=/dev/pilot
MM_CHARSET=iso-8859-1
#LANG=en_US
LESSCHARSET=latin1

MANPATH="$MANPATH:/usr/local/linkedin/man"

export EDITOR MORE LESS MANPATH NETHACKOPTIONS NNTPSERVER PAGER PRINTER
export REMOTE XSHELL KEYMAP PGPPATH IMM_IMAGE_DIR DISPLAY_GAMMA FETCH_CMD
export PILOTRATE PILOTPORT MM_CHARSET LANG LESSCHARSET

if [ -e "$HOME/Dropbox/memory.txt" ]; then
  MEMORY_FILE="$HOME/Dropbox/memory.txt"
else
  MEMORY_FILE="$HOME/.memory"
fi

# load aliases
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases; fi
# and shell functions
if [ -f ~/.bash_funs ]; then source ~/.bash_funs; fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ "$PS1" ]; then

  # interactive shell
  interactive=true

  # prompt string looks like "user@host:working/directory history bash$ "
  PS1="\u@\h:\w \! bash\\\$ "

  if test -n "$PBEMMODE"; then
    PS1="PBEM: $PS1"
  fi

  # interactive-only variables
  shopt -s checkhash
  # shopt -s checkjobs
  shopt -s checkwinsize
  shopt -s cmdhist

  HISTCONTROL=ignorespace:ignoredups:erasedups
  HISTTIMEFORMAT="%F %T "
  HISTFILESIZE=5000
  HISTSIZE=5000
  MAILCHECK=60
  auto_resume=
  no_exit_on_failed_exec=
  notify=

  if test -t; then
    # we are talking to a tty
#    stty dec
    stty erase '^?' intr '^C' kill '^U' eof '^D' susp '^Z'
#    stty werase '^W'
    mesg n
  fi

  # terminal management for use with UW
  if [ $TERM = s4 ]; then export UW_TERM="s4"; fi
  if [ $TERM = vt100 ]; then export UW_TERM="vt100"; fi
  if [ $TERM = ansi ]; then export UW_TERM="ansi"; fi

  if [ $TERM = adm31 ]; then
    if test -n "$UW_TERM" ; then
      export TERM=$UW_TERM
      export TERMCAP=$HOME/.termcap
#     stty 2400 >/dev/tty
    fi
  fi
  if [ x$LAYER != x ]; then
    export TERMINFO=$HOME/.terminfo
  fi

  #if [ x$WINDOWID != x ]; then
  #  eval `resize`
  #fi

fi
