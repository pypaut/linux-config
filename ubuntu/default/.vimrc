" GENERAL
set mouse=a
set number
set relativenumber
set cursorline
set colorcolumn=79
let g:netrw_banner = 0

" COLORS & RICING
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=black
hi ColorColumn ctermbg=0 guibg=lightgrey
hi LineNr ctermfg=Blue
hi CursorLineNr ctermfg=Blue
set fillchars-=vert:\| | set fillchars+=vert:\ 
syntax on

" EDITOR
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

" SPECIAL CHARACTERS
set list
set listchars=tab:>-

" Ctrl + n to comment selected lines in visual mode
map <C-n> :norm i# <Return>
