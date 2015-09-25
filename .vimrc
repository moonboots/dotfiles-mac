set nocompatible

imap jk <Esc>
set tabstop=2 expandtab shiftwidth=2 softtabstop=2

filetype plugin indent on
syntax on

let mapleader=" "
let maplocalleader=" "
set visualbell t_vb=

set hidden " don't warn about unsaved buffer
set rnu
set ignorecase
set smartcase

set hlsearch
" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>

set noesckeys
set timeoutlen=500

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-commentary'
xmap \  <Plug>Commentary
nmap \ <Plug>CommentaryLine

Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/syntastic'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
noremap <Leader>u :UltiSnipsEdit<CR>

Plug 'kien/ctrlp.vim', {'on': 'CtrlP'}
noremap <silent> <leader>t :CtrlP<CR>

Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
silent! nnoremap <silent> <Leader>p :NERDTreeToggle<CR>

Plug 'jlanzarotta/bufexplorer', {'on':  'BufExplorer'}
nnoremap <leader>b :BufExplorer<cr>

call plug#end()

runtime! plugin/sensible.vim
set laststatus=1
