""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set filetype=vim tabstop=4 softtabstop=4 shiftwidth=4 expandtab :
" vim: set fileencoding=UTF-8 :
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" George Goulas
"""""""""""""""""""""""""""""
" Basic settings
"""""""""""""""""""""""""""""
set nu                      " Print Line Numbers
set nocompatible            " Enable vim enhancements
set visualbell              " Disable beeps
set mouse=a                 " Use mouse integration
set hlsearch                " Hilight search results
syntax on                   " Enable syntax highlighting
set encoding=utf-8

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
    Plugin 'airblade/vim-gitgutter'  " Shows git status symbols in the gutter
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'NLKNguyen/vim-maven-syntax'
    Plugin 'Conque-shell'
    Plugin 'surround.vim'
    Plugin 'benmills/vimux'
    Plugin 'tpope/vim-fugitive'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
call vundle#end()
filetype indent plugin on

" Enable folding
" fold with za or change it to space with nnoremap
" set foldmethod=indent
" set foldlevel=99
" nnoremap <space> za

" Show docstrings of folded code for SimpylFold
let g:SimpylFold_docstring_preview=1

" use 256 colors when possible
"if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
"    colorscheme molokai
"else
"   colorscheme delek
"endif


" colors for gvim
if has('gui_running')
    "colorscheme wombat
    colorscheme solarized
    set background=dark
    let g:solarized_termcolors=256
else
    "set background=dark
    colorscheme desert
endif

"""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""
set modelines=5
set modeline

"""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""
set laststatus=2
" airline options
let g:airline_powerline_fonts=1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
"let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
"let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
"let g:airline#extensions#tabline#show_splits = 0

"  let g:airline_symbols.whitespace = 'Ξ'
"  let g:airline_symbols.branch = '⎇'
"  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '◀'


"  if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"  endif
"  " unicode symbols
"  let g:airline_left_sep = '»'
"  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '«'
"  let g:airline_right_sep = '◀'
"  let g:airline_symbols.linenr = '␊'
"  let g:airline_symbols.linenr = '␤'
"  let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.branch = '⎇'
"  let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
"  let g:airline_symbols.whitespace = 'Ξ'

"""""""""""""""""""""""""""""
" Color column on column 80
"""""""""""""""""""""""""""""
highlight ColorColumn ctermbg=Gray
highlight ColorColumn guibg=#4a4a59
set colorcolumn=80

"""""""""""""""""""""""""""""
" GitGutter settings
"""""""""""""""""""""""""""""
" Default keys:
" GitGutterNextHunk ]c
" GitGutterPrevHunk [c
" GitGutterStageHunk <Leader>hs
" GitGutterRevertHunk <Leader>hr
" GitGutterPreviewHunk <Leader>hp
highlight clear SignColumn

"""""""""""""""""""""""""""""
" Show invisible characters
"""""""""""""""""""""""""""""
" Toggle show invisibles using \l
nmap <leader>l :set list!<CR>
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~,eol:$"
"" Set characters like textmate
set listchars=tab:▸\ ,eol:¬
set nolist
highlight NonText guifg=#4a4a59 guibg=grey20    " color for newline
highlight SpecialKey guifg=#4a4a59              " color for tab

"""""""""""""""""""""""""""""
" Settings for file types
"""""""""""""""""""""""""""""
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix|set fileencoding=UTF-8
autocmd BufWritePost *.py call Flake8()
autocmd FileType sh set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab


"""""""""""""""""""""""""""""
" Settings for NERDTree
"""""""""""""""""""""""""""""
" open NERDTree on vim startup and focus on file window
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" Sync editor - NERDTree pane
map <Leader>r :NERDTreeFind<CR>:wincmd p<CR>
" Exit NERDTree if no file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree with C-o
map <C-o> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>


"""""""""""""""""""""""""""""
" Reload vimrc on save
"""""""""""""""""""""""""""""
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') && filereadable($MYGVIMRC) | so $MYGVIMRC | endif
augroup END


"""""""""""""""""""""""""""""
" better backup, swap and undos storage
"""""""""""""""""""""""""""""
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
