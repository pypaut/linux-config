syntax enable

" === PLUGINS
call plug#begin("~/.vim/plugged")
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/glsl.vim'
Plug 'yggdroot/indentline'
call plug#end()


" === PLUGINS SETUP
" --- Lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
set noshowmode

" --- glsl
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.shd setf glsl

" --- indentline
let g:indentLine_char = '|'


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
set cursorline
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


" === SPECIAL CHARACTERS
set list
set listchars=tab:>-


" === THEME
hi StatusLine   ctermbg=Black ctermfg=8
hi StatusLineNC ctermbg=Black ctermfg=8
hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=White
hi VertSplit    ctermbg=Black ctermfg=Black
hi CursorLine   ctermbg=Black ctermfg=none  cterm=bold
hi Comment      ctermbg=none  ctermfg=8
hi Cursor       ctermbg=none  ctermfg=0
hi Folded       ctermbg=none  ctermfg=8
hi MatchParen   ctermbg=none  ctermfg=2     cterm=bold
colorscheme nord


" === CUSTOM COMMANDS
" --- Python
command! Black !black -l 79 %:p

" --- Groff
command! MakePDF !/home/pypaut/.scripts/makepdf.sh %:p
au BufWritePost *.ms silent MakePDF
command! OpenPDF !/home/pypaut/.scripts/openpdf.sh %:p
command! GetMS !/home/pypaut/.scripts/getheader.sh %:p

