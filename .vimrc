" vim-plug start
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'yianwillis/vimcdoc'
call plug#end()
" vim-plug end

filetype on
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
set smartindent
set backspace=indent,eol,start

" Python
autocmd FileType python set expandtab
autocmd FileType python set textwidth=79


" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Insert current date and time
map <F2> oDate:<Esc>:read !date<CR>kJ0

" F5 to auto run .py file
map <F5> :call RunPythonFile()<CR> 
function RunPythonFile()
	exec "w"
	if &filetype ==  'python'	
		exec "!clear"
		exec "!time python3 %"
	endif
endfunction
