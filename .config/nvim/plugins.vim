" === PLUGINS

call plug#begin("~/.vim/plugged")
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/glsl.vim'
call plug#end()

" --- Lightline
let g:lightline = {
            \ 'colorscheme': 'ayu_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }
set noshowmode

" --- glsl
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.shd setf glsl

" --- indentline
let g:indentLine_char = '|'
