" GENERAL
set mouse=a
set number
set relativenumber
set cursorline
" set colorcolumn=79
let g:netrw_banner = 0

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set expandtab

" COLORS & RICING
hi clear
syntax on
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=Black
hi ColorColumn ctermbg=Black guibg=lightgrey
hi LineNr ctermfg=Blue
hi CursorLineNr ctermfg=Blue
set fillchars-=vert:\| | set fillchars+=vert:\ 

" WARNINGS
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" SEARCH OPTIONS
set ignorecase
set smartcase " case sensitive only if uppercase
set incsearch
set nohlsearch

" SPECIAL CHARACTERS
set list
set listchars=tab:>-

" Ctrl + n to comment selected lines with v
map <C-n> :norm i# <Return>
