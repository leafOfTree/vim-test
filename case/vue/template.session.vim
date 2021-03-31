redir >> %messages

normal! gg
while search('/template', 'W')
  if GetVueTag() != 'template'
    echo 'expect tag to be template, but got '.GetVueTag()
  endif
endwhile

normal! gg
call search('/docs', 'W')
let syntax_list = GetCurrentSyntaxList()
if count(syntax_list, 'markdownDocsBlock')
  echo '<docs> in template should not be markdown'
endif
call search('/docs', 'W')
let syntax_list = GetCurrentSyntaxList()
if !count(syntax_list, 'markdownDocsBlock')
  echo '<docs> should be markdown'
endif

redir END
