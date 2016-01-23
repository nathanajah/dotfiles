call plug#begin()

" Workaround to overwrite vim-sensible settings
Plug 'tpope/vim-sensible'
call plug#load('vim-sensible')

Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'fholgado/minibufexpl.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'chriskempson/base16-vim'

" Language specific
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'marijnh/tern_for_vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Rip-Rip/clang_complete'

call plug#end()

filetype plugin indent on

" Workaround for tmux escape lag
set ttimeoutlen=0

" Indentation

set expandtab
set tabstop=2
set shiftwidth=2

" Line numbers
set number relativenumber

" Undo
set undodir=/home/nathanajah/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2

" tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <F7> :NERDTreeToggle<CR>

" base16-ocean
set background=dark
let base16colorspace =256
colorscheme base16-ocean
syntax on

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#auto_completion_start_length = 0
let g:min_pattern_length = 0

let g:deoplete#sources = {}
let g:deoplete#sources.cpp = ['clang_complete', 'buffer', 'tag']

inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <S-Tab> <C-p>

" vim-jsx
let g:jsx_ext_required = 0

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

" clang_complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
