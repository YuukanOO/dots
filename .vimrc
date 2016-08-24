set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set title
set ruler
set wrap
set scrolloff=3
set ignorecase
set smartcase
set incsearch
set hlsearch
set visualbell
set noerrorbells
set backspace=indent,eol,start
set hidden
set number
set cursorline
set colorcolumn=80
set foldmethod=indent

let mapleader = ","
let g:pathogen_disabled=["vim-css-color"]

syntax enable
filetype on
filetype plugin on
filetype indent on
execute pathogen#infect()
set background=dark
set t_Co=256
let base16colorspace=256

colorscheme base16-materia

set laststatus=2
let g:airline_powerline_fonts = 0

if has("gui_running")
  set guifont=Inconsolata_for_Powerline:h11:cDEFAULT
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
endif

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

let g:neocomplete#enable_at_startup= 1
let g:airline_theme='base16'

let g:go_fmt_autosave = 0
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:ctrlp_custom_ignore='.*node_modules.*'
let g:syntastic_check_on_open=1

set expandtab
set shiftwidth=2
set softtabstop=2
