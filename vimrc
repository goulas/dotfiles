""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set filetype=vim tabstop=4 softtabstop=4 shiftwidth=4 expandtab :
" vim: set fileencoding=UTF-8 :
"""""""""""""""""""""""""""""
" Basic settings
"""""""""""""""""""""""""""""
set nu                      " Print Line Numbers
set nocompatible            " Enable vim enhancements
set visualbell              " Disable beeps
colorscheme desert          " Set colorscheme
set mouse=a                 " Use mouse integration
syntax on                   " Enable syntax highlighting

"""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""
set modelines=5
set modeline
filetype indent plugin on


"""""""""""""""""""""""""""""
" Color column on column 80
"""""""""""""""""""""""""""""
highlight ColorColumn ctermbg=Gray 
highlight ColorColumn guibg=#4a4a59
set colorcolumn=80

"""""""""""""""""""""""""""""
" Show invisible characters
"""""""""""""""""""""""""""""
" Toggle show invisibles using \l
nmap <leader>l :set list!<CR>
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~,eol:$"
"" Set characters like textmate
" set listchars=tab:▸\ ,eol:¬
set list
highlight NonText guifg=#4a4a59 guibg=grey20    " color for newline
highlight SpecialKey guifg=#4a4a59              " color for tab

"""""""""""""""""""""""""""""
" Reload vimrc on save
"""""""""""""""""""""""""""""
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') && filereadable($MYGVIMRC) | so $MYGVIMRC | endif
augroup END

