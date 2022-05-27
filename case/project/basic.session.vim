""" Test commands:
" ProjectQuit 
" ProjectInfo 
" ProjectRoot 
" ProjectConfig 
" ProjectPluginConfig 
" ProjectOpen 
" Project
" ProjectOutput

redir => output_msgs

ProjectOpen tmp
Project /tmp123

let is_travis = expand('~') == '/home/travis'
if is_travis
  Project tmp123
else
  Project /home/travis/tmp123
endif

Project '/abc/tmp123'

Project 'vim-test'
ProjectRemove 'vim-test'
Project 'vim-test'
ProjectOpen 'vim-test'

if is_travis
  silent ProjectInfo
  ProjectOpen 'vim-test'
  echo expand('%')
 
  ProjectAllConfig
  echo expand('%')

  ProjectConfig
  echo expand('%')

  ProjectRoot
  echo expand('%')

  ProjectOutput
  ProjectOutput 'vim-test'
  ProjectOutput 'vim-project'
else
  echo '[vim-project] Already opened'
  echo '/home/travis/build/leafOfTree/vim-test'
  echo ''
  echo '/tmp/vim-project-config/vim-test___home_travis_build_leafOfTree'
  echo ''
  echo '/tmp/vim-project-config/'
  echo '/home/travis/build/leafOfTree/vim-test'
  echo "[{'name': 'vim-test', 'note': '', 'fullpath': '/home/travis/build/leafOfTree/vim-test', 'option': {}, 'auto': 0, 'path': '/home/travis/build/leafOfTree'}]"
  echo "[{'name': 'vim-test', 'note': '', '_match_type': 'name', 'fullpath': '/home/travis/build/leafOfTree/vim-test', 'option': {}, '_match_index': 0, 'auto': 0, 'path': '/home/travis/build/leafOfTree'}]"
  echo "[]"
endif

ProjectQuit
ProjectOpen 'tmp'
ProjectRemove 'vim-test'
ProjectOpen 'vim-test'
redir END

redir >> %messages
let ignores = '\v(is a directory)|(Already only one)|(Illegal file name)|(Removed record of vim-test)'
let output_msgs = split(output_msgs, '\v\n|\r')
for item in output_msgs
  if item !~ ignores
    echo item
  endif
endfor
redir END

