redir >> %messages

normal! gg

while search('/template', 'W')
  if GetVueTag() != 'template'
    echo 'expect tag to be template, but got '.GetVueTag()
  endif
endwhile

redir END
