redir >> %messages

function! CheckSyntax(keyword, syntax)
  call search(a:keyword, 'W')
  let syntax_list = GetCurrentSyntaxList()
  if !count(syntax_list, a:syntax)
    echo 'keyword '.a:keyword.' should be highlighted as '.a:syntax.', but got '
    echo syntax_list
  endif
endfunction

normal! gg
call CheckSyntax('v-bind', 'cssFunctionName')
call CheckSyntax('slotted', 'cssPseudoClassId')
call CheckSyntax('global', 'cssPseudoClassId')
call CheckSyntax('deep', 'cssPseudoClassId')

redir END
