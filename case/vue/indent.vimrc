" Check messages.txt for output messages
filetype plugin indent on
syntax on
set rtp+=../%plugin
set nocp
set expandtab

autocmd FileType vue :setlocal shiftwidth=2

let g:vim_vue_plugin_test = 1
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'script': ['javascript'],
      \   'template': ['html'],
      \   'style': ['css'],
      \},
      \'init_indent': 1,
      \}
