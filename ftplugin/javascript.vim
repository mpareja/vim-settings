" Refactorings
" ------------

" function declaration > function expression
" Initiation Point: function name
nmap <leader>rfe diwbivar pa = function (ldf(f{%a;F}%

" function decleration > arrow function
" Initiation Point: function keyword
nmap <leader>rfa diwdt(f)a =>

" var to const
nmap <leader>rvc ciwconst

let b:dispatch = 'npm test'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
