#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
echo '[test] Current path is ' $parent_path
cd "$parent_path"

plugin_dir="../../vim-svelte-plugin"
if [ ! -d "$plugin_dir" ] 
then
  echo '[test] Error: vim-svelte-plugin is not found at ' $plugin_dir
  exit 1
fi

rm -f output.svelte output.txt

vim -es -u vimrc.vim -S cmds.vim test.svelte
diff_result=`diff -u test.svelte output.svelte`
messages_result=`cat output.txt`

if [ ! -z "$diff_result" ]
then
  echo '[test] Error: file is changed after indentation'
  echo $diff_result
  exit 1
else
  echo '[test] No unexpected changes'
fi
if [ ! -z "$messages_result" ]
then
  echo '[test] Error: there are unexpected messages'
  echo $messages_result
  exit 1
else
  echo '[test] No unexpected messages'
fi

echo '[test] Testing is successful'
