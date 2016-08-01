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

let g:pathogen_disabled=["vim-css-color"]

syntax enable
filetype on
filetype plugin on
filetype indent on
execute pathogen#infect()
set background=dark
set t_Co=16
let base16colorspace=256

colorscheme base16-materia

set laststatus=2
let g:airline_powerline_fonts = 0
let mapleader = ","

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
let g:neocomplcache_enable_at_startup = 1
let g:airline_theme='base16'
let g:go_fmt_autosave = 0

set expandtab
set shiftwidth=2
set softtabstop=2
