call system('rm -r /tmp/vim-project-config')

let path = expand('%:p:h:h:h')
let g:vim_project_config = {
      \'home': '/tmp/vim-project-config', 
      \'project_base': path,
      \'session': 1, 
      \'auto_detect': 'no',
      \}
