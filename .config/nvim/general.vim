" === GENERAL

" --- File browse
let g:netrw_banner=0
noremap <C-p> :find 
set path=**
set updatetime=100
set wildmenu

" --- Text search
set ignorecase
set incsearch
set nohlsearch
set smartcase

" --- Brackets
inoremap {; {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O


" --- General
set autoindent
set autoread
" set cursorline
set expandtab
set fileformat=unix
set laststatus=2
set mouse=a
set number
set relativenumber
set shiftround
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set statusline=%F
set tabstop=4
set ttimeoutlen=0
" set timeoutlen=0
" set guicursor=
" set clipboard+=unnamedplus

" --- Special characters
set list
set listchars=tab:>-
