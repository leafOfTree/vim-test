" See messages.txt for output messages
filetype plugin indent on
syntax on
set rtp+=../%plugin
set rtp+=../vim-pug,../vim-coffee-script,../typescript-vim,../vim-stylus
let runtime = expand('%:p:h').'/runtime'
let &rtp = runtime.','.&rtp
set nocp
set expandtab

autocmd FileType svelte :setlocal shiftwidth=2

" vim-svelte-plugin config
let g:vim_svelte_plugin_use_pug = 1
let g:vim_svelte_plugin_use_less = 1
let g:vim_svelte_plugin_use_sass = 1
let g:vim_svelte_plugin_use_coffee = 1
let g:vim_svelte_plugin_load_full_syntax = 1
let g:vim_svelte_plugin_highlight_svelte_attr = 1
let g:vim_svelte_plugin_use_foldexpr = 1
