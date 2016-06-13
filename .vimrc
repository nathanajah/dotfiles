set nocompatible
" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-commentary'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'chriskempson/base16-vim'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim'
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()

filetype plugin indent on

" Vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2

" tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <F7> :NERDTreeToggle<CR>

" base16-ocean
set background=dark
let base16colorspace=256
colorscheme base16-ocean
syntax on
set number relativenumber

" phpcomplete-extended
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:phpcomplete_index_composer_command='composer'

" Indentation
set expandtab
set tabstop=2
set shiftwidth=2

" Ctrl-P
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']

au BufRead,BufNewFile /home/nathanajah/projects/nuansaticket/api/* set tabstop=2 shiftwidth=2

" Undo
set undodir=/home/nathanajah/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
