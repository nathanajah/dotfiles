set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimproc.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'jeaye/color_coded'

call vundle#end()

filetype plugin indent on
syntax on
set number
set relativenumber

" Base16-ocean
let base16colorspace=256
set background=dark
colorscheme base16-ocean

" Vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2

" tagbar
nmap <F8> :TagbarToggle<CR>

" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
