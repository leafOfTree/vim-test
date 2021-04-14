#!/bin/bash
# set -e

if [ $# -lt 2 ] 
then
  echo "Example: bash start.sh <filetype> <plugin>"
  exit
fi

filetype=$1 # vue, svelte, ...
plugin=$2 # vim-vue-plugin, vim-svelte-plugin, ...

function main() {
  init
  run_test_case
}

function init() {
  parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
  plugin_dir="../$plugin"

  echo "[test] $(vim --version | head -1)"
  echo "[test] $(nvim --version | head -1)"

  echo "[test] Current path is $parent_path"
  echo "[test] Plugin is $plugin_dir for $filetype"

  cd "$parent_path"
  if [ ! -d "$plugin_dir" ] 
  then
    tput setaf 1; echo "✘ [test] Error: $plugin_dir is not found" 
    exit 1
  fi
}

function run_test_case() {
  echo "[test] Target *.$filetype"
  files=$(ls case/$filetype/*.$filetype)
  for file in $files
  do
    filename=${file/case\/$filetype\//}
    name=${filename/.$filetype/}
    run_test_case_file $name
  done

  # echo '[test] Target random-*'
  # files=$(ls case/$filetype/random-*/*/*.$filetype)
  # for file in $files
  # do
    # filename=${file/case\/$filetype\/random-*\//}
    # name=${filename/.$filetype}
    # foldername=${file/case\/$filetype\//}
    # folder=${foldername/\/*\/*.$filetype}
# 
    # run_test_case_file $name $file $folder
  # done

  if [ ! -z $error ]; then
    echo '✘ [test] failed'
    exit 1
  else
    echo '✔ [test] passed'
  fi
}

function run_test_case_file() {
  if [ $# -eq 1 ] 
  then
    name=$1
    case="case/$filetype/$name.$filetype"
    case_vimrc="case/$filetype/$name.vimrc"
    case_session="case/$filetype/$name.session.vim"
  fi

  if [ $# -eq 3 ] 
  then
    name=$1
    case=$2
    folder=$3
    case_vimrc="case/$filetype/$folder.vimrc"
    case_session="case/$filetype/$folder.session.vimrc"
  fi

  common_session="lib/session.vim"
  target="output/$name.$filetype"
  result="output/$name.output.$filetype"
  vimrc="output/$name.vimrc"
  session="output/session.vim"
  local_session="output/$name.session.vim"
  messages="output/messages.txt"

  # echo
  # echo "● [test] $case, vim"
  test vim

  # echo "● [test] $case, nvim"
  test nvim
}

function test() {
  if [ ! -z $1 ]; then
    vim=$1
  else
    vim="vim"
  fi

  rm -f output/*.*
  cp $case $target
  cp $case_vimrc $vimrc
  cp $common_session $session
  sed -i -e "s#%plugin#$plugin#g" $vimrc
  sed -i -e "s#%filetype#$filetype#g; s#%result#$result#g; s#%target#$target#g; s#%messages#$messages#g;" \
    $session
  if [ -f $case_session ]; then
    cp $case_session $local_session
    sed -i -e "s#%filetype#$filetype#g; s#%result#$result#g; s#%target#$target#g; s#%messages#$messages#g;" \
      $local_session
  fi

  $vim -es -u $vimrc -S $session -S $local_session -c "q!" $target
  check
}

function check() {
  diff_result=`diff --color -u $target $result`
  messages_result=`cat $messages`

  if [ ! -z "$diff_result" ]
  then
    diff --color -u $target $result
    tput setaf 1; echo "✘ [test] Error: $case changed after indentation"
    tput setaf 7
    error=1
    # exit 1
  # else
    # echo '✔ [test] No unexpected changes caused by indentation'
  fi
  if [ ! -z "$messages_result" ]
  then
    tput setaf 1; echo '✘ [test] Error: there are unexpected messages'
    tput setaf 1; printf %"s\n" "$messages_result"
    tput setaf 7
    error=1
    # exit 1
  # else
    # echo '✔ [test] No unexpected messages'
  fi
  # echo '✔ [test] passed'
}

main
