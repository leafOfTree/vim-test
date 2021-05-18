redir => output_msgs

ProjectOpen 'tmp'

call project#begin()

Project '/tmp123'
if expand('~') == '/home/travis'
  Project 'tmp123'
else
  ProjectBase '/home/travis'
  Project 'tmp123'
endif

ProjectBase '/abc'
Project 'tmp123'

let path = expand('%:p:h:h:h')

ProjectBase path
Project 'vim-test'
ProjectOpen 'vim-test'

if expand('~') == '/home/travis'
  ProjectInfo
else
  echo '[vim-project] Name: vim-test, path: /home/travis/build/leafOfTree'
endif

ProjectOpen 'vim-test'
echo expand('%')

ProjectConfig
echo expand('%')

ProjectPluginConfig
echo expand('%')

ProjectRoot
echo expand('%')

ProjectExit

ProjectOpen 'tmp'
redir END

redir >> %messages
let ignores = '\v(is a directory)|(Already only one)'
let output_msgs = split(output_msgs, '\v\n|\r')
for item in output_msgs
  if item !~ ignores
    echo item
  endif
endfor
redir END
