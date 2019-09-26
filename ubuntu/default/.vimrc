set mouse=a
set number
set relativenumber
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=DarkGrey
set colorcolumn=79
highlight ColorColumn ctermbg=0 guibg=lightgrey
let g:netrw_banner = 0
set fillchars-=vert:\| | set fillchars+=vert:\ 

syntax on
set expandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent

" SEARCH OPTIONS
set ignorecase
set smartcase " case sensitive only if uppercase
set incsearch

" TRAILING SPACES
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set list
set listchars=tab:>-


" ### KEY BINDINGS ###

" Ctrl + n to comment selected lines with v
map <C-n> :norm i# <Return>
