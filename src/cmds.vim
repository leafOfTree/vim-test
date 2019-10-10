set filetype=svelte
normal! gg=G
w! output.svelte

!rm -f output.txt

redir => output_msgs
messages
redir END

let expected = '\v(Messages maintainer)|(\"test.svelte\")|(\"output.svelte\")|(lines to indent)|(lines indented)'
let output_msgs = split(output_msgs, '\r')

redir > output.txt
for item in output_msgs
  if item !~ expected
    echo item
  endif
endfor
redir END

q!
