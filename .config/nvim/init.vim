call plug#begin()

" Workaround to overwrite vim-sensible settings
Plug 'tpope/vim-sensible'
call plug#load('vim-sensible')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoinclude.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'fholgado/minibufexpl.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'chriskempson/base16-vim'
Plug 'embear/vim-localvimrc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-lawrencium'


" Language specific
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'marijnh/tern_for_vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Rip-Rip/clang_complete'
Plug 'zchee/deoplete-jedi'

call plug#end()

filetype plugin indent on

" Workaround for tmux escape lag
set ttimeoutlen=0

runtime! runtime/base.vim
runtime! runtime/colorscheme.vim
runtime! runtime/airline.vim
runtime! runtime/tagbar.vim
runtime! runtime/nerdtree.vim
runtime! runtime/deoplete.vim
runtime! runtime/vim_jsx.vim
runtime! runtime/vim_fzf.vim
runtime! runtime/clang_complete.vim
runtime! runtime/neomake.vim
runtime! runtime/jedi.vim
runtime! runtime/neosnippet.vim
runtime! localruntime/active/*.vim
