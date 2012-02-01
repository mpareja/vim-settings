" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

" Try and use either of these fonts if available
if has("gui_gtk2")
	set guifont=Consolas\ 12,Inconsolata\ 12
elseif has("gui_win32")
	set guifont=Consolas:h12,Inconsolata\ Medium:h12,Consolas\ Regular\:h11
endif

set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
" set background=light              " Background.
" set lines=25 columns=100          " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar


