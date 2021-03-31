redir >> %messages

normal! gg
let num = 0

while num < 5
  call search('/template')
  if GetVueTag() != 'template'
    echo 'expect tag to be template, but got '.GetVueTag()
  endif
  let num = num + 1
endwhile

redir END
