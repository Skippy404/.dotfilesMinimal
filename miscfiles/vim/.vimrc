" misc {{{
set updatetime=100
set tags=./tags;$HOME
let @r=':r !cat /dev/random | tr -dc 0-9a-zA-Z | head -c 32' " Random 32 bytes
" }}}

" vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'gregsexton/gitv'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'valloric/vim-indent-guides'
Plug 'fedorenchik/VimCalc3'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
call plug#end()
" }}}

" Colors {{{
"GRUVBOX
silent! colorscheme gruvbox
silent! set background=dark

"MONOKAI DARK
"colorscheme monokai

"SPACE-VIM-DARK
"colorscheme space-vim-dark
"hi Comment cterm=italic
" }}}

" FUNCTIONS {{{
function! <SID>StripTrailingWhiteSpaces()
  "prep: save last searched
  let _s=@/
  let l = line(".")
  let c = col(".")
  " remove trailing
  let c = col(".")
  %s/\s\+$//e
  " restore hostory
  let @/=_s
  call cursor(l, c)
endfunction
" }}}

" COMMANDS {{{
"show trailing white spaces by default
:command Trail /\s\+$
" remove all whitespaces when done
nnoremap <silent> <F5> :call <SID>StripTrailingWhiteSpaces()<CR>
"autocmd BufWritePre *.txt, *.c :call <SID>StripTrailingWhiteSpaces()
" }}}

" KEYBINDS {{{
nnoremap \ :noh<return>
nnoremap <C-\> :ToggleNumber()<CR>
nnoremap <C-l> :IndentGuidesToggle<return>
nnoremap <C-n> :NERDTreeToggle<CR>
"space open/closes folds
nnoremap <space> za
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <S-x> :bdelete<CR>
" }}}

" Custom "commands {{{
inoremap jp<Tab> System.out.println("");<Esc>2hi
inoremap cp<Tab> printf("\n");<Esc>4hi
inoremap clib<Tab>   #include <stdlib.h><CR>#include <stdio.h><Esc>
" }}}

" ALL SETS {{{
set colorcolumn=80
set number
set relativenumber
set hlsearch
set hidden
"TAB SETTINGS
set autoindent    " Copy indent from current line when starting a new line.
set tabstop=4     " Size of a hard tabstop (ts).
set shiftwidth=4  " Size of an indentation (sw).
"set expandtab     " Always uses spaces instead of tab characters (et).
set noexpandtab
set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
"END TAB SETTINGS
"FOLD SETTINGS
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
"END FOLD SETTINGS
syntax enable
set cursorline
set wildmenu
set modelines=1
" }}}

" air-line {{{
let g:Powerline_symbols = 'fancy'
let g:airline_theme='base16'
let g:airline_solorized_bg='dark'
set t_Co=256

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2
let g:airline_symbols={}

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" }}}

"vim:foldmethod=marker:foldlevel=0
