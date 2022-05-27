call system('rm -r /tmp/vim-project-config')

let g:vim_project_config = {
      \'config_home': '/tmp/vim-project-config',
      \'auto_detect': 'no',
      \'project_base': [expand('%:p:h:h:h')],
      \}
