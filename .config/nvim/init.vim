" === FIX FOR SWAP FILE ERROR
set directory=.,$TEMP


"  === GENERAL
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
set smarttab
set autoindent
"set smartindent
set expandtab


" === AUTO CLOSING (GOAL: auto insert closing + insert tab when hit return)
"inoremap ( ()<Esc>i
"inoremap (<CR> (<CR>)<Esc>ko<tab>
"inoremap [ []<Esc>i
"inoremap { {<CR>}<Esc>O
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i


" === COLORS & RICING
hi clear
syntax on
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=Black
hi ColorColumn ctermbg=Black guibg=lightgrey
hi LineNr ctermfg=Blue
hi CursorLineNr ctermfg=Blue
" --- Separator character
set fillchars-=vert:\| | set fillchars+=vert:\ 
" --- Active status line
hi StatusLine ctermbg=Black ctermfg=Blue
" --- Inactive status line
hi StatusLineNC ctermbg=Black ctermfg=Blue
" --- Vertical separation line
hi VertSplit ctermbg=Black ctermfg=Black
" --- Status bar
set laststatus=0
set statusline=
"set shortmess=F


" === WARNINGS
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


" === SEARCH OPTIONS
set ignorecase
set smartcase " case sensitive only if uppercase
set incsearch
set nohlsearch


" === SPECIAL CHARACTERS
set list
set listchars=tab:>-


" === SHORTCUTS
" --- Ctrl + n to comment selected lines with v
map <C-n> :norm i# <Return>

" --- F2 to exec Python code
autocmd FileType python nnoremap <buffer> <F2> :exec '!python3' shellescape(@%, 1)<cr>
