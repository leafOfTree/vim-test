""" Test commands
" ProjectQuit 
" ProjectInfo 
" ProjectRoot 
" ProjectConfig 
" ProjectPluginConfig 
" ProjectOpen 
" ProjectBase
" ProjectAdd
" ProjectOutput

redir => output_msgs

ProjectOpen tmp
ProjectAdd /tmp123

let is_travis = expand('~') == '/home/travis'
if is_travis
  ProjectAdd tmp123
else
  ProjectBase /home/travis
  ProjectAdd tmp123
endif

ProjectBase '/abc'
ProjectAdd 'tmp123'

let path = expand('%:p:h:h:h')

execute 'ProjectBase '.path
ProjectAdd 'vim-test'
ProjectAdd 'vim-test'
ProjectOpen 'vim-test'

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

  ProjectOutput
  ProjectOutput 'vim-test'
  ProjectOutput 'vim-project'
else
  echo '[vim-project] Name: vim-test, path: /home/travis/build/leafOfTree'
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
let ignores = '\v(is a directory)|(Already only one)|(Illegal file name)'
let output_msgs = split(output_msgs, '\v\n|\r')
for item in output_msgs
  if item !~ ignores
    echo item
  endif
endfor
redir END
