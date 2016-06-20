let g:neomake_python_flake8_maker = {
            \ 'exe': 'python3',
            \ 'args': ['-m', 'flake8', '--format=default'],
            \ 'errorformat':
                \ '%E%f:%l: could not compile,%-Z%p^,' .
                \ '%A%f:%l:%c: %t%n %m,' .
                \ '%A%f:%l: %t%n %m,' .
                \ '%-G%.%#',
            \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
            \ }
