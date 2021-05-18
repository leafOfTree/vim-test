""" Test commands
" ProjectExit 
" ProjectInfo 
" ProjectRoot 
" ProjectConfig 
" ProjectPluginConfig 
" ProjectOpen 
" ProjectBase
" Project
" ProjectOutput

redir => output_msgs

let is_travis = expand('~') == '/home/travis'
ProjectOpen 'tmp'

call project#begin()

Project '/tmp123'
if is_travis
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

if is_travis
else
endif

if is_travis
  ProjectInfo
  ProjectOpen 'vim-test'
  echo expand('%')

  ProjectConfig
  echo expand('%')

  ProjectPluginConfig
  echo expand('%')

  ProjectRoot
  echo expand('%')
else
  echo '[vim-project] Name: vim-test, path: /home/travis/build/leafOfTree'
  echo '[vim-project] Already opened'
  echo '/home/travis/build/leafOfTree/vim-test'
  echo ''
  echo '/tmp/vim-project-config/vim-test___home_travis_build_leafOfTree'
  echo ''
  echo '/tmp/vim-project-config/'
  echo ''
  echo '/home/travis/build/leafOfTree/vim-test'
endif

ProjectExit

ProjectOpen 'tmp'

ProjectOutput
ProjectOutput 'vim-test'
ProjectOutput 'vim-project'

redir END

redir >> %messages
let ignores = '\v(is a directory)|(Already only one)|(Illegal file name)'
let output_msgs = split(output_msgs, '\v\n|\r')
for item in output_msgs
  if item !~ ignores
    echo item
  endif
endfor
redir END
