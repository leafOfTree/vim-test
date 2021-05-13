redir >> %messages

ProjectOpen 'tmp'

call project#begin()

Project '/tmp123'
Project 'tmp123'

ProjectBase '/abc'
Project 'tmp123'

let path = expand('%:p:h:h:h')
ProjectBase path
Project 'vim-test'
ProjectOpen 'vim-test'

ProjectOpen 'tmp'

redir END
