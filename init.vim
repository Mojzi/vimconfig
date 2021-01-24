
syntax on
set exrc
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set cursorline
set lazyredraw
set showmatch
set incsearch
set foldenable
set nowrap
set noerrorbells
set scrolloff=8

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile

set colorcolumn=80
set signcolumn=yes

highlight ColorColumn ctermbg=0 guibg=lightgrey

" don't indent return types in C/C++ function when return type is line above
" function name
set cinoptions+=t0

call plug#begin()

" Neovim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'keith/swift.vim'
Plug 'udalov/kotlin-vim'

Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme gruvbox
set background=dark

" FINDING FILES:

" Search down into subfolders
" set path+=**
" Display all matching files when we tab complete
" set wildmenu

" FILE BROWSING:

let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3


let mapleader = " "

