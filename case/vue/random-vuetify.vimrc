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
      \   'template': ['html'],
      \   'script': ['javascript'],
      \   'style': ['css', 'sass', 'scss'],
      \   'codepen-additional': ['javascript', 'json'],
      \},
      \'full_syntax': [],
      \'attribute': 1,
      \'keyword': 1,
      \'foldexpr': 1,
      \'init_indent': 1,
      \'debug': 0,
      \}
