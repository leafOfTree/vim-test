" Check messages.txt for output messages
filetype plugin indent on
syntax on
set rtp+=../%plugin
set rtp+=../vim-pug,../vim-coffee-script,../typescript-vim,../vim-stylus
let runtime = expand('%:p:h').'/runtime'
let &rtp = runtime.','.&rtp
set nocp
set expandtab

autocmd FileType vue :setlocal shiftwidth=2

let g:vim_vue_plugin_test = 1
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'script': ['javascript'],
      \   'template': ['html'],
      \   'style': ['css'],
      \   'docs': 'markdown',
      \},
      \}
