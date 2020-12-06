syntax enable

" === BROWSING
let g:netrw_banner=0
noremap <C-p> :find 
set path=**
set updatetime=100
set wildmenu

" === SEARCHING
set ignorecase
set incsearch
set nohlsearch
set smartcase

" === BRACKETS
inoremap {; {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O

" === GENERAL
set autoindent
set autoread
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
hi CursorLine ctermbg=None ctermfg=none cterm=None

" === SPECIAL CHARACTERS
set list
set listchars=tab:>-
