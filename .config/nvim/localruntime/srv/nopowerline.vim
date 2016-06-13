" ctrlspace
let g:CtrlSpaceUseUnicode = 0

" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.linenr = 'LN'
