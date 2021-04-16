set rtp+=../vim-pug,../vim-coffee-script,../typescript-vim,../vim-stylus

let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html', 'pug'],
      \   'script': ['javascript', 'typescript', 'coffee'],
      \   'style': ['css', 'scss', 'sass', 'less', 'stylus'],
      \   'docs': 'markdown',
      \   'i18n': ['json', 'yaml'],
      \   'route': 'json',
      \},
      \'attribute': 1,
      \'keyword': 1,
      \'foldexpr': 1,
      \'init_indent': 0,
      \'full_syntax': ['scss', 'less'],
      \'debug': 0,
      \}
