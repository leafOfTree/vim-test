redir >> %messages

normal! gg
call search('/template')
if GetVueTag() != 'template'
  echo 'expect tag to be template, but got '.GetVueTag()
endif

call search('/template')
if GetVueTag() != 'template'
  echo 'expect tag to be template, but got '.GetVueTag()
endif

redir END
