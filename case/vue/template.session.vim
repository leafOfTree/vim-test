redir >> %messages

if GetVueTag() != 'template'
  echo 'expect tag to be template, but got '.GetVueTag()
endif

redir END
