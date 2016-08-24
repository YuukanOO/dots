" Common options
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
set background=dark
set t_Co=256
set laststatus=2
set expandtab
set shiftwidth=2
set softtabstop=2

let base16colorspace=256

syntax enable
filetype on
filetype plugin on
filetype indent on

let mapleader = ","

" Disabled plugins
let g:pathogen_disabled=["vim-css-color"]

" Launch pathogen infection
execute pathogen#infect()

colorscheme base16-materia

let g:airline_powerline_fonts = 0

" Sets some specific options when using gvim
if has("gui_running")
  set guifont=Inconsolata_for_Powerline:h11:cDEFAULT
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
endif

" Keybindings
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Keybindings for GO
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Plugins configuration

" NEOCOMPLETE
let g:neocomplete#enable_at_startup= 1

" AIRLINE
let g:airline_theme='base16'

" VIM-GO
let g:go_fmt_autosave = 0
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" CTRLP
let g:ctrlp_custom_ignore='.*node_modules.*'

" SYNTASTIC
let g:syntastic_check_on_open=1
