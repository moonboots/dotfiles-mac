set nocompatible

imap jk <Esc>
set tabstop=2 expandtab shiftwidth=2 softtabstop=2

filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic', {'on': 'CtrlP'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
call plug#end()
