#!/bin/bash


####[Global Vars]####

note_dir_path=$HOME/.zk;

YELLOW='\033[0;33m'
MAG='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

####[End of Global Vars]####


####[Command Params]####

verb=$1
noun=$2

####[End of Command Params]####


####[Placeholders]####

md_tpl () {

  title=$noun

cat > $file_path << EOL
# `echo $title`
EOL

}

####[End of Placeholders]####


####[Functions]####

_new () {
  timestamp=`date +%Y-%m-%d-%s`;

  mkdir $note_dir_path/$timestamp
  file_path=$note_dir_path/$timestamp/README.md

  md_tpl $file_path

  cd $note_dir_path && vim --clean $file_path;
}

_list () {
  #TODO: logic to list all notes
  echo "TODO: logic to list all notes"
}

_open () {
 cd $note_dir_path && vim;
}

_search () {
  echo -e "${CYAN}Search Results:${YELLOW}"
  results=(`grep -iRl $note_dir_path -e $noun`)

  path=()
  name=()

  for i in ${results[@]}; do
    path+=($i)
  done

  for i in ${results[@]}; do
    first_line=$(head -n 1 $i)
    title=${first_line//\# /}
    slug=${title// /-}
    name+=($slug)
  done

  select answer in "${name[@]}"; do
    count=0
    for item in "${name[@]}"; do
      if [[ $item == $answer ]]; then
        vim --clean ${path[$count]}
        break 2
      fi
      let count++
    done
  done
}

_help () {
  echo -e "${CYAN}[new]${NC} => Create new note. e.g.: zk new [\"Title of your note\"]";
  echo -e "${CYAN}[list]${NC} => List all note";
  echo -e "${CYAN}[open]${NC} => Open note directory";
}

####[End of Functions]####


####[Processes]####

case "$verb" in
  new)
    _new
    ;;
  list)
    _list
    ;;
  open)
    _open
    ;;
  search)
    _search
    ;;
  help)
    _help
    ;;
  *)
    echo "no args"
    ;;
esac

####[End of Processes]####
