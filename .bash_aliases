# -*- shell-script -*-
# misc aliases

alias ptime="perl -e 'print time, \"\\n\";'"

alias j='jobs -l'
alias up='uptime'

alias la='ls -aC'
alias laf='ls -aFC'
alias lf='ls -FC'
alias ls='ls -C'
alias ll='ls -al'
alias pop='popd'
alias pd='pushd'

alias vncstart='vncserver -geometry 1200x750'
alias vncstop='vncserver -kill :1'

case $MACH_TYPE in
  mips)
    alias su='/bin/su -e'
    alias su1='ssu -e'
    ;;
  *)
    alias su1='su root'
    ;;
esac


