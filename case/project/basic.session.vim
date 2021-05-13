redir >> %messages

ProjectOpen 'tmp'

call project#begin()

Project '/tmp123'
Project 'tmp123'

ProjectBase '/abc'
Project 'tmp123'

ProjectBase '/home/travis/build/leafOfTree'
" Project 'vim-test'

" ProjectOpen 'vim-test'

redir END
