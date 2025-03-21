" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#infect()
silent! call pathogen#incubate()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set nowrap						  " Disable line wrapping

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
"set hlsearch                      " Highlight matches.

" avoid pause when hitting escape
set ttimeout
set ttimeoutlen=50

let g:netrw_liststyle= 3

"set wrap                          " Turn on line wrapping.
" allow up/down navigation between wrapped lines
nmap <silent> j gj
nmap <silent> k gk
nmap <silent> <down> gj
nmap <silent> <up> gk
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,$HOME\_vim\tmp,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

vmap <Tab> >gv
vmap <S-Tab> <gv

" setup code folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
"set foldlevel=1
map zM :set foldenable<CR>:set foldlevel=1<CR>

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType tf  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType md  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType sh  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml  setlocal shiftwidth=2 tabstop=2 expandtab

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
autocmd BufNewFile,BufRead *.csx set filetype=cs


let g:dispatch_terminal_exec = 'i3-sensible-terminal -e'

" Toggle MakeGreen
"   For some odd reason, the initial autocmd for enabling needs to be run
"   twice. Disable it in between to in case attaching twice is a problem.
"map <leader>tt :MakeGreen<CR>
map <leader>tl :Start npm run lint -- --fix %<CR>
map <leader>tt mT:TestNearest<CR>
map <leader>ts mT:TestFile<CR>
map <leader>tw :Start watch-tests %:p<CR>
map <leader>td :Start ndb node_modules/.bin/jest --no-coverage --watch --runInBand -- -- %<CR>
map <leader>tr :TestLast<CR>
" map <leader>te :autocmd BufWritePost *.js MakeGreen<CR>
" map <leader>td :autocmd! BufWritePost *.js<CR>

" navigation
map <leader>gg :TernDef<CR>
map <leader>gh :TernDocBrowse<CR>
map <leader>gl :TlistToggle<CR>

let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" ease editing of .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

if !has("win32") || has("gui_win32")
	" DISABLED: let desktop theme control vim theme
	" use solarized dark colour scheme
	" set background=dark
	" colorscheme solarized
endif

" bring up cheatsheet
nmap <silent> <leader>eh :e ~/.vim/cheatsheet.md<CR>
nmap <silent> <leader>ejs :!cat ~/.vim/snippets/javascript.snippets<CR>

" disable automatically changing to project root vim-rooter (use <leader>cd to get there)
let g:rooter_manual_only = 1

" FuzzySearch: exclude node_modules dir from fuzzy search
let g:fuf_dir_exclude = '\v(^|[/\\])(\.(hg|git|bzr))|(node_modules)|(build)(|(coverage)$|[/\\])'
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])(\.(hg|git|bzr))|(build)|(node_modules)|(coverage)($|[/\\])'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])(\.(hg|git|bzr))|(build)|(node_modules)|(coverage)($|[/\\])'

nnoremap <silent> <leader>ss :Ggrep \\\<<cword>\\><CR>
if has("win32")
	nnoremap <silent> <leader>sb :FufBuffer<CR>
	nnoremap <silent> <leader>sc :FufCoverageFile<CR>
	nnoremap <silent> <leader>sf :FufFile<CR>
	nnoremap <silent> <leader>sq :FufQuickfix<CR>
	nnoremap <silent> <leader>sr :FufRenewCache<CR>
else
	" Note to Windows self: compare async and no async file_rec on Windows
	nnoremap <silent> <leader>sb :Unite -start-insert buffer<CR>
	nnoremap <silent> <leader>sc :Unite -start-insert file_rec/async<CR>
	nnoremap <silent> <leader>sq :Unite quickfix<CR>
	nnoremap <silent> <leader>sr :UniteResume<CR>
endif

map <silent> <Leader>m :tabnew +MagitOnly<CR>
let g:unite_source_file_async_command =
	\ 'ag -l --nocolour --nogroup --hidden --follow --ignore ".git/" --ignore "node_modules" -g ""'
let g:unite_source_rec_async_command = [
	\ 'ag', '-l', '--nocolor', '--nogroup', '--hidden', '--follow',
	\ '--ignore', '.git/', '--ignore', 'node_modules/', '--ignore', 'coverage/', '-g', '' ]

" Better Accented Character Support
inoremap <expr>  <C-K>   BDG_GetDigraph()

" enable mouse support in terminal
set mouse=a

" toggle indentation while inserting and display status
set pastetoggle=F2
set showmode

" tab settings overrides
autocmd FileType jade set ts=2 sw=2 expandtab

""""" gutentags configuration
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']

" centralize tag files
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

" tagging triggers
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" snipmate configuration
let g:snipMate = { 'snippet_version' : 1 }

""""" NERDTree
nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
