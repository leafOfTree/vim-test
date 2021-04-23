redir >> %messages

function! CheckFoldlevel(lnum, level)
  let level = foldlevel(a:lnum)
  if level != a:level
    echo 'foldlevel at '.a:lnum.' should be '.a:level.', but got '.level
  endif
endfunction

call CheckFoldlevel(1, 1)
call CheckFoldlevel(2, 2)
call CheckFoldlevel(3, 1)
call CheckFoldlevel(4, 1)
call CheckFoldlevel(5, 1)
call CheckFoldlevel(5, 1)
call CheckFoldlevel(6, 1)
call CheckFoldlevel(7, 2)
call CheckFoldlevel(8, 3)
call CheckFoldlevel(9, 4)
call CheckFoldlevel(10, 3)
call CheckFoldlevel(11, 3)
call CheckFoldlevel(12, 1)
call CheckFoldlevel(13, 1)
call CheckFoldlevel(14, 1)
call CheckFoldlevel(15, 1)
call CheckFoldlevel(15, 1)
call CheckFoldlevel(16, 1)
call CheckFoldlevel(17, 2)
call CheckFoldlevel(18, 2)
call CheckFoldlevel(19, 1)
call CheckFoldlevel(20, 1)

redir END
