syntax enable

let g:dotfilesPath = '~/.config/nvim/'

let g:nvimPlugins  = g:dotfilesPath . 'plugins.vim'
let g:nvimGeneral  = g:dotfilesPath . 'general.vim'
let g:nvimCommands  = g:dotfilesPath . 'commands.vim'

exe 'source ' g:nvimPlugins
exe 'source ' g:nvimGeneral
exe 'source ' g:nvimCommands

colorscheme catppuccin-latte
hi Normal guibg=0 ctermbg=0
