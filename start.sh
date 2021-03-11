#!/bin/sh

if [ $# -lt 2 ] 
then
  echo "Example: bash start.sh <filetype> <plugin>"
  exit
fi

filetype=$1 # "svelte"
plugin=$2 # "vim-svelte-plugin"

# Input files
vimrc_template="lib/vimrc_template.vim"
session_template="lib/session_template.vim"
example="example.$filetype"

# Generated files
vimrc="vimrc.vim"
session="session.vim"
output="example.output.$filetype"
messages="messages.txt"

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
plugin_dir="../$plugin"

echo "[test] Current path is $parent_path"
echo "[test] Plugin is $plugin_dir for $filetype"
vim --version

cd "$parent_path"
if [ ! -d "$plugin_dir" ] 
then
  tput setaf 1; echo "✘ [test] Error: $plugin_dir is not found" 
  exit 1
fi

rm -f $output $messages $session

sed -e "s/%filetype/$filetype/g; s/%output/$output/g; s/%example/$example/g; s/%messages/$messages/g;" \
  $session_template > $session

sed -e "s/%plugin/$plugin/g" $vimrc_template > $vimrc

vim -es -u $vimrc -S $session $example
diff_result=`diff -u $example $output`
messages_result=`cat $messages`

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
