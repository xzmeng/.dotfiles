" encoding
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set termencoding=utf-8
set encoding=utf-8

" vim-plug start
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'yianwillis/vimcdoc'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
call plug#end()
" vim-plug end

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

" remap pane switch
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" remap tab switch

" NERDTree
map <C-n> :NERDTreeFocus<CR>

" LeaderF
let g:Lf_ShortcutF = '<C-P>'

" Insert current date and time
map <F2> oDate:<Esc>:read !date<CR>kJ0

" F5 to auto run .py file
map <F5> :call Run()<CR>
function Run()
	exe "w"
	if &filetype ==  'python'	
		exe "!time python3 %"
	elseif &filetype == 'c'
		exe "!gcc % -o %< && ./%<"
	endif
endfunction

" F6 demo
map <F6> :call Demo()<CR>
function Demo()
	w
endfunction
