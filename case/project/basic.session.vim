redir => output_msgs

ProjectOpen 'tmp'

call project#begin()

Project '/tmp123'
Project 'tmp123'

ProjectBase '/abc'
Project 'tmp123'

let path = expand('%:p:h:h:h')
ProjectBase path
Project 'vim-test'
ProjectOpen 'vim-test'
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
