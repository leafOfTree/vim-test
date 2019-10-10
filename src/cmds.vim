set filetype=vue
normal! gg=G
w! output.vue

!rm -f output.txt

redir => output_msgs
messages
redir END

let expected = '\v(Messages maintainer)|(\"test.vue\")|(\"output.vue\")|(lines to indent)|(lines indented)'
let output_msgs = split(output_msgs, '\r')

redir > output.txt
for item in output_msgs
  if item !~ expected
    echo item
  endif
endfor
redir END

q!
