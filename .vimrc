set mouse=a
set number
set relativenumber
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=black
" hi CursorLine guibg=Grey40 ctermbg=darkgrey
" ctermfg=white
let g:netrw_banner = 0

syntax on
set expandtab

" set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" color dracula
" color minimalist
