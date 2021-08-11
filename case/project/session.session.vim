redir => output_msgs

let is_travis = expand('~') == '/home/travis'

ProjectAdd 'vim-test'
ProjectOpen 'vim-test'
edit readme.md
echo expand('%')

ProjectQuit

ProjectOpen 'vim-test'
echo expand('%')
redir END

redir >> %messages
let ignores = '\v(is a directory)|(Already only one)|(Illegal file name)|"readme.md"'
let output_msgs = split(output_msgs, '\v\n|\r')
for item in output_msgs
  if item !~ ignores
    echo item
  endif
endfor
redir END
