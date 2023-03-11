
if ls --color=auto &> /dev/null; then
  export LS_OPTIONS='--color=auto'
  eval "$(dircolors)"
fi

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
