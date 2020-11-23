syntax enable
filetype plugin on


" === PLUGINS
call plug#begin("~/.vim/plugged")
Plug 'arcticicestudio/nord-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()


" === PLUGINS SETUP
" --- Lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
set noshowmode

" --- vim-rainbow
let g:rainbow_active = 1

" --- vim-fugitive
nnoremap gc :G commit<CR>
nnoremap gs :G<CR>


" === BROWSING
let g:netrw_banner=0
noremap <C-p> :find 
set path=**
set updatetime=100
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
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
set guicursor=


" === SPECIAL CHARACTERS
set list
set listchars=tab:>-


" === COLORS
colorscheme nord
hi CursorLine ctermbg=None ctermfg=none cterm=None


" === WARNINGS
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufNew * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)


" === COMMANDS AND KEYBINDINGS
" --- CTags command
command! Maketags !ctags -R .

" --- Run commands
autocmd FileType python call SetRunPython()
autocmd FileType rust call SetRunRust()
autocmd FileType vim call SetRunVim()
autocmd BufRead *.md call SetRunMd()
autocmd BufRead *.h call SetRunC()
autocmd BufRead *.c call SetRunC()
autocmd BufRead *.cc call SetRunC()
autocmd BufRead *.hh call SetRunC()

" --- Open config
" FIXME: how to refresh current vim instance?
" It seems `:source %` on config file doesn't do the trick.
command! Config tabnew /home/pypaut/.config/nvim/init.vim



" === FUNCTIONS
function! SetRunPython()
    command! Black !black -l 79 %:p
    command! Run !python3 %:p
    autocmd BufWritePre * :%s/\s\+$//e
endfunction

function SetRunRust()
    command! Run !cargo run
    autocmd BufWritePre * :%s/\s\+$//e
endfunction

function SetRunVim()
    silent command! Run source %:p
endfunction

function SetRunMd()
    command! Run !/home/pypaut/Programs/md_to_pdf.sh %:p | xargs zathura &
    set textwidth=79
    autocmd BufWritePre * :%s/\s\+$//e
endfunction

function SetRunC()
    autocmd BufWritePre * :%s/\s\+$//e
endfunction


" === MISC
au FocusGained,BufEnter * :checktime
