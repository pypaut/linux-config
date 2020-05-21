syntax enable
filetype plugin on

" === BROWSING
set path+=**
set wildmenu
let g:netrw_banner=0
let g:netrw_list_hide=netrw_gitignore#Hide()


" === SEARCHING
set ignorecase
set smartcase
set incsearch
set nohlsearch


" === GENERAL
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set autoindent
set smartindent
set expandtab
set cursorline
set number
set relativenumber
set fileformat=unix
set laststatus=2
set statusline=%F


" === WARNINGS
set fillchars-=vert:\| | set fillchars+=vert:\ 
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)


" === SPECIAL CHARACTERS
set list
set listchars=tab:>-


" === COLORS
hi StatusLine   ctermbg=Black ctermfg=Blue
hi StatusLineNC ctermbg=Black ctermfg=Blue
hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=White
hi VertSplit    ctermbg=Black ctermfg=Black
hi CursorLine   ctermbg=Black ctermfg=none  cterm=bold
hi Comment      ctermbg=none  ctermfg=8
hi Cursor       ctermbg=none  ctermfg=0
hi Folded       ctermbg=none  ctermfg=8
hi MatchParen   ctermbg=none  ctermfg=2     cterm=bold


" === COMMANDS
command! Maketags !ctags -R .
