if empty(&filetype)
  setf %filetype
endif
normal! gg=G

w! %result

" Save messages
!rm -f %messages

redir => output_msgs
messages
redir END

let ignores = '\v(Messages maintainer)|(\"%target\")|(\"%result\")|(lines to indent)|(lines indented)|(ATTENTION)|(is a directory)'
let output_msgs = split(output_msgs, '\v\n|\r')

redir > %messages

for item in output_msgs
  if item !~ ignores
    echo item
  endif
endfor

redir END

" Helper functions for local session
function! GetCurrentSyntaxList()
  return map(synstack(line('.'), col('.')), { _, id -> synIDattr(id, 'name') })
endfunction
