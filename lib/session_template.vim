if empty(&filetype)
  set filetype=%filetype
  normal! gg=G
endif
w! %output

" Save messages
!rm -f %messages

redir => output_msgs
messages
redir END

let ignores = '\v(Messages maintainer)|(\"%example\")|(\"%output\")|(lines to indent)|(lines indented)'
let output_msgs = split(output_msgs, '\v\n|\r')

redir > %messages

for item in output_msgs
  if item !~ ignores
    echo item
  endif
endfor

redir END
q!
