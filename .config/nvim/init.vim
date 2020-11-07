syntax enable
filetype plugin on


" === PLUGINS
call plug#begin("~/.vim/plugged")
Plug 'arcticicestudio/nord-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" === PLUGINS SETUP
" --- Airline
let g:airline_theme='nord'
"
" --- YouCompleteMe
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'

" --- vim-rainbow
let g:rainbow_active = 1

" --- fzf
let g:fzf_layout = {'window': {'width': 0.5, 'height': 0.3}}
let g:fzf_preview_window = []
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(
        \ <q-args>,
        \ {'options': ['--exact']},
        \ <bang>0)
noremap <C-p> :Files<CR>
command! -bang -nargs=* Agu
    \ call fzf#vim#ag(
        \ <q-args>,
        \ '--nofilename',
        \ {'window': {'width': 0.5, 'height': 0.3}})
noremap <C-S-f> :Agu<CR>

" --- vim-fugitive
nnoremap gs :G<CR>
nnoremap gb :GBranches<CR>
nnoremap gc :Commit<CR>


" === BROWSING
let g:netrw_banner=0
set path+=**
set updatetime=100
set wildmenu


" === SEARCHING
set ignorecase
set smartcase
set incsearch
set nohlsearch


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


" === SPECIAL CHARACTERS
set list
set listchars=tab:>-


" === COLORS
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


" === WARNINGS
autocmd BufWritePre * :%s/\s\+$//e


" === COMMANDS AND KEYBINDINGS
" --- CTags command
command! Maketags !ctags -R .
" --- Run commands
autocmd FileType python call SetRunPython()
autocmd FileType rust call SetRunRust()
autocmd FileType vim call SetRunVim()
autocmd BufEnter *.md call SetRunMd()
noremap <C-S-m> :Run<CR>
" --- Brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" === FUNCTIONS
function! SetRunPython()
    command! Black !black -l 79 %:p
    command! Run !python3 %:p
endfunction

function SetRunRust()
    command! Run !cargo run
endfunction

function SetRunVim()
    silent command! Run source %:p
endfunction

function SetRunMd()
    command! Run !/home/pypaut/Programs/md_to_pdf.sh %:p | xargs zathura &
    set textwidth=79
endfunction

" === MISC
au FocusGained,BufEnter * :checktime
