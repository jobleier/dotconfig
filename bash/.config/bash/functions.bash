up() {
  [ "${1/[^0-9]/}" == "$1" ] && {
    local ups=""
      for i in $(seq 1 "$1")
      do
        ups=$ups"../"
      done
      cd $ups
    } || echo "usage: up INTEGER"
}

dic() {
  DIC_HIST="$HOME/.local/share/dic_history"

  if [ "$1" = "-l" ]; then
    local _lang=$2;
    shift 2;
  else
    local _lang=deen;
  fi; 

  if [ "$1" = "-h" ]; then
    cat "${DIC_HIST}"
    return 
  fi  

  if [ "${_lang}" == "deen" ];
  then
    _lang=""
  else        
    _lang="${_lang}."
  fi      

  w3m -dump "https://${_lang}pocket.dict.cc?s=\"$*\"" | sed -r -e '/^([ ]{5,}.*)$/d' -e '1,2d' -e '/^$/d' -e '/^\[/d'
  echo "$@" >> "${DIC_HIST}"
}

mkd() { mkdir -p "$@" && cd "$@"; }
