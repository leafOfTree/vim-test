redir >> %messages

function! CheckKeyword(keyword, syntax)
  call search(a:keyword, 'W')
  let syntax_list = GetCurrentSyntaxList()
  if !count(syntax_list, a:syntax)
    echo 'keyword '.a:keyword.' should be highlighted, but got '
    echo syntax_list
  endif
endfunction

normal! gg
call CheckKeyword('name', 'vueObjectKey')
call CheckKeyword('data', 'vueObjectFuncKey')
call CheckKeyword('data', 'vueObjectFuncName')
call CheckKeyword('computed', 'vueObjectKey')
call CheckKeyword('mounted', 'vueObjectFuncName')

redir END
