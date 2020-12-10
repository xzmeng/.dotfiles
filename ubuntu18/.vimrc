" color scheme
"color desert

" cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" encoding
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set termencoding=utf-8
set encoding=utf-8

" vim-plug start
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" leader
let mapleader=","

" mouse support
set mouse=a
set ttymouse=xterm2

"highlight
set hlsearch

filetype on
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
set smartindent
set backspace=indent,eol,start

set scrolloff=3

" Python
autocmd FileType python set expandtab
autocmd FileType python set textwidth=79

" C
autocmd FileType c set tabstop=4
autocmd FileType c set shiftwidth=4
autocmd FileType c set softtabstop=4

" yaml
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2

" remap pane switch
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" NERDTree
noremap <C-n> :NERDTreeFocus<CR>

" FZF
noremap <silent> <C-p> :FZF<CR>

