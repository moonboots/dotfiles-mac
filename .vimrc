set nocompatible

imap jk <Esc>
set timeoutlen=500
set tabstop=2 expandtab shiftwidth=2 softtabstop=2

filetype plugin indent on
syntax on

let mapleader=" "
let maplocalleader=" "
set visualbell t_vb=

set hidden " don't warn about unsaved buffer

set relativenumber
set number
set numberwidth=2

set ignorecase
set smartcase

set hlsearch
" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>

set noesckeys

set cursorline

" disable existing cursorline styles like underlining
highlight CursorLine cterm=NONE

" highlight current line number green
highlight CursorLineNR ctermfg=112

au InsertEnter * highlight Cursorline ctermbg=233
au InsertEnter * highlight CursorLineNR ctermfg=196

au InsertLeave * highlight Cursorline ctermbg=none
au InsertLeave * highlight CursorLineNR ctermfg=112


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-commentary'
xmap \ <Plug>Commentary
nmap \ <Plug>CommentaryLine

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Plug 'guns/vim-sexp' | Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'tpope/vim-abolish'
Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
noremap <Leader>u :UltiSnipsEdit<CR>

Plug 'kien/ctrlp.vim', {'on': 'CtrlP'}
noremap <silent> <leader>t :CtrlP<CR>

Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
silent! nnoremap <silent> <Leader>p :NERDTreeToggle<CR>

Plug 'jlanzarotta/bufexplorer', {'on': 'BufExplorer'}
nnoremap <leader>b :BufExplorer<cr>

Plug 'bronson/vim-trailing-whitespace'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

call plug#end()

" Override sensible.vim settings
runtime! plugin/sensible.vim
set laststatus=1
