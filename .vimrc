syntax on
set expandtab
set nu
set relativenumber
set ts=4
set sw=4
set backspace=indent,eol,start

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
call plug#end()
