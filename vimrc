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
set hlsearch                " Hilight search results
syntax on                   " Enable syntax highlighting

"""""""""""""""""""""""""""""
" Vundle
" Brief help for Vundle
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle/plugins")
    Plugin 'gmarik/Vundle.vim'
    Plugin 'scrooloose/nerdtree.git'
    Plugin 'ctrlp.vim'
    Plugin 'vim-flake8'
call vundle#end()
filetype indent plugin on

"""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""
set modelines=5
set modeline

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
" Settings for file types
"""""""""""""""""""""""""""""
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
autocmd FileType python set fileencoding=UTF-8
autocmd BufWritePost *.py call Flake8()
autocmd FileType sh set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab


"""""""""""""""""""""""""""""
" Reload vimrc on save
"""""""""""""""""""""""""""""
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') && filereadable($MYGVIMRC) | so $MYGVIMRC | endif
augroup END

