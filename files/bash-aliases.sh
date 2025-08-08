
if ls --color=auto &> /dev/null; then
  export LS_OPTIONS='--color=auto'
  eval "$(dircolors)"
fi

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -la'

# New and improved tools
function replace() {
  if command -v "${2}" >/dev/null; then
    # shellcheck disable=SC2139
    alias "${1}=${2}"
  fi
}

replace ls eza
replace ls exa
replace cat bat
replace cat batcat
replace du dust
replace df duf
replace ps px

unset replace
