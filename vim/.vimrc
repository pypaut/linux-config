set mouse=a
set number
set relativenumber
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=black
set colorcolumn=79
highlight ColorColumn ctermbg=0 guibg=lightgrey
let g:netrw_banner = 0

syntax on
set expandtab

"set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" color dracula
" color minimalist

set list
set listchars=tab:>-

" Ctrl + n to comment selected lines with v
map <C-n> :norm i# <Return>
