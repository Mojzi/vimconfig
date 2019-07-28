if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif

set nocompatible
set nobackup

syntax enable
set number
set relativenumber
set cursorline
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable

" don't indent return types in C/C++ function when return type is line above
" function name
set cinoptions+=t0

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'ajh17/VimCompletesMe'
Plugin 'ervandew/supertab'
Plugin 'Rip-Rip/clang_complete'
Plugin 'davidhalter/jedi-vim'
Plugin 'keith/swift.vim'
Plugin 'udalov/kotlin-vim'

call vundle#end()
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
nnoremap <leader><space> :nohlsearch<CR>

let g:clang_library_path='/usr/lib/libclang.so'

" FINDING FILES:

" Search down into subfolders
set path+=**
" Display all matching files when we tab complete
set wildmenu

" FILE BROWSING:

let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3

" set omnifunc=syntaxcomplete#Complete

" Close that preview window
autocmd CompleteDone * pclose

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
