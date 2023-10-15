" === COMMANDS

" --- Config
command! Source source /home/$USER/.config/nvim/init.vim

" --- Python
command! Black !black -l 79 %:p

" --- Go
command! GoFmt !go fmt %:p
au BufWritePost *.go silent GoFmt
au BufWritePost *.go silent :edit
au FileType golang setlocal listchars=tab: 

" --- Groff
command! MakePDF !/home/pypaut/.scripts/makepdf.sh %:p
au BufWritePost *.ms silent MakePDF
command! OpenPDF !/home/pypaut/.scripts/openpdf.sh %:p
command! GetMS !/home/pypaut/.scripts/getheader.sh %:p
au BufNewFile,BufRead *.ms inoremap é \['e]
au BufNewFile,BufRead *.ms inoremap è \[`e]
au BufNewFile,BufRead *.ms inoremap à \[`a]
au BufNewFile,BufRead *.ms inoremap ù \[`u]
au BufNewFile,BufRead *.ms inoremap ê \[^e]
au BufNewFile,BufRead *.ms inoremap ô \[^o]
au BufNewFile,BufRead *.ms inoremap É \['e]
au BufNewFile,BufRead *.ms inoremap È \[`e]
au BufNewFile,BufRead *.ms inoremap À \[`A]
au BufNewFile,BufRead *.ms inoremap Ù \[`U]
au BufNewFile,BufRead *.ms inoremap Ê \[^E]
au BufNewFile,BufRead *.ms inoremap Ô \[^O]

" --- YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" --- .twig
au BufRead,BufNewFile *.twig set filetype=html
