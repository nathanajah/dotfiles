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

" Indentation
set expandtab
set tabstop=4
set shiftwidth=4

" Line numbers
set number relativenumber

" Undo
set undodir=/home/nathanajah/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" base16-ocean
set background=dark
let base16colorspace=256
colorscheme base16-ocean
syntax on

" Vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
set laststatus=2

" tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <F7> :NERDTreeToggle<CR>


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#auto_completion_start_length = 0
let g:min_pattern_length = 0

let g:deoplete#sources = {}
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.cpp = ['omni']

inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <S-Tab> <C-p>

" vim-jsx
let g:jsx_ext_required = 0

" FZF
nmap <C-p> :Files<CR>

" clang_complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_use_library = 1
let g:clang_library_path = '/lib/libclang.so'

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_python_enabled_makers = ['flake8']

let g:neomake_cpp_enabled_makers = ['gcc', 'clangtidy']
let g:neomake_cpp_gcc_maker = {
      \ 'exe': 'g++',
      \ 'args': ['-O2', '-std=c++11'],
      \ }

let g:neomake_cpp_clangtidy_maker = {
      \ 'exe': 'clang-tidy',
      \ 'args': ['%:p', '-checks=*', '--', '-std=c++11'],
      \ 'errorformat':
      \ '%E%f:%l:%c: fatal error: %m,' .
      \ '%E%f:%l:%c: error: %m,' .
      \ '%W%f:%l:%c: warning: %m,' .
      \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
      \ '%E%m',
      \ 'append_file': 0,
      \ }

let g:neomake_java_enabled_makers = ['javac']

autocmd! BufWritePost * Neomake

" jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python set tabstop=4 shiftwidth=4
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

set hidden
