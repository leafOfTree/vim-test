set filetype=svelte
normal! gg=G
w! output.svelte

!rm -f output.txt

redir => output_msgs
messages
redir END

let ignores = '\v(Messages maintainer)|(\"test.svelte\")|(\"output.svelte\")|(lines to indent)|(lines indented)'
let output_msgs = split(output_msgs, '\v\n|\r')

redir > output.txt
for item in output_msgs
  if item !~ ignores
    echo item.'\n\r'
  endif
endfor
redir END

q!
