let g:neomake_cpp_clangtidy_maker = {
            \ 'exe': 'clang-tidy',
            \ 'args': ['%:p', '-checks=*', '--', '-I/usr/include/c++/4.2.1/', '-std=c++11'],
            \ 'errorformat':
            \ '%E%f:%l:%c: fatal error: %m,' .
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
            \ '%E%m',
            \ 'append_file': 0,
            \ }
