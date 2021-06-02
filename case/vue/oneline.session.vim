redir >> %messages

function! CheckKeyword(keyword, syntax)
  call search(a:keyword, 'W')
  let syntax_list = GetCurrentSyntaxList()
  if !count(syntax_list, a:syntax)
    echo 'keyword '.a:keyword.' should be highlighted as '.a:syntax.', but got '
    echo syntax_list
  endif
endfunction

normal! gg
call CheckKeyword('script', 'javascriptScriptBlock')
" call CheckKeyword('style', 'cssStyleBlock')
call CheckKeyword('p {', 'cssStyleBlock')
call CheckKeyword('color', 'cssTextProp')
call CheckKeyword('p {', 'cssStyleBlock')
call CheckKeyword('color', 'cssTextProp')
call CheckKeyword('Hello', 'htmlTemplateBlock')

redir END
