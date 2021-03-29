#!/bin/sh
set -e

if [ $# -lt 2 ] 
then
  echo "Example: bash start.sh <filetype> <plugin>"
  exit
fi

echo "[test] vim --version"
vim --version | head -1

filetype=$1 # vue, svelte, ...
plugin=$2 # vim-vue-plugin, vim-svelte-plugin, ...

function main() {
  init

  files=$(ls case/$filetype/*.$filetype)
  for file in $files
  do
    file=${file/case\/$filetype\//}
    file=${file/.$filetype/}
    run_test_case $file
  done
}

function init() {
  parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
  plugin_dir="../$plugin"

  echo "[test] Current path is $parent_path"
  echo "[test] Plugin is $plugin_dir for $filetype"

  cd "$parent_path"
  if [ ! -d "$plugin_dir" ] 
  then
    tput setaf 1; echo "✘ [test] Error: $plugin_dir is not found" 
    exit 1
  fi
  rm -f output/*.*
}

function run_test_case() {
  name=$1
  vimrc_name=$1
  case_example="case/$filetype/$name.$filetype"
  case_vimrc_template="case/$filetype/$vimrc_name.vim"
  output="$name.output.$filetype"
  example="$name.$filetype"
  echo "⚪[test] test $case_example with $case_vimrc_template"
  test
}

function test() {
  # Input files
  session_template="lib/session_template.vim"

  # Generated files
  vimrc="vimrc.vim"
  session="session.vim"
  messages="messages.txt"

  # Copy case files
  vimrc_template="vimrc_template.vim"
  cp $case_vimrc_template $vimrc_template
  cp $case_example $example


  rm -f $output $messages $session

  sed -e "s/%filetype/$filetype/g; s/%output/$output/g; s/%example/$example/g; s/%messages/$messages/g;" \
    $session_template > $session

  sed -e "s/%plugin/$plugin/g" $vimrc_template > $vimrc

  vim -es -u $vimrc -S $session $example
  diff_result=`diff -u $example $output`
  messages_result=`cat $messages`

  # Clean temporary files to output/
  mv $example output
  mv $output output
  mv $messages output
  mv $session output
  mv $vimrc output
  rm $vimrc_template

  if [ ! -z "$diff_result" ]
  then
    tput setaf 1; echo '✘ [test] Error: file is changed after indentation'
    tput setaf 1; printf %"s\n" "$diff_result"
    exit 1
  else
    echo '✔ [test] No unexpected changes after indentation'
  fi
  if [ ! -z "$messages_result" ]
  then
    tput setaf 1; echo '✘ [test] Error: there are unexpected messages'
    tput setaf 1; printf %"s\n" "$messages_result"
    exit 1
  else
    echo '✔ [test] No unexpected messages'
  fi

  echo '✔ [test] Testing is successful'
}

main
