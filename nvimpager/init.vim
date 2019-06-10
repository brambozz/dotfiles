" vimrc file Bram de Wilde, see GitHub for changelog 
"--------------------------------------------------
" This file assumes the keyboard layout is Colemak

" Remap movement keys
:noremap n j
:noremap N J
:noremap e k
:noremap E K
:noremap i l
:noremap I L
:noremap o h
:noremap O H

" Other remaps
:noremap l i
:noremap L I
:noremap k o
:noremap K O
:noremap h e
:noremap H E
:noremap j n
:noremap J N

" Map scrolling more logically
:noremap <C-N> <C-D>
:noremap <C-E> <C-U>

" Display line numbers
:set number

" filetype plugin indent on
syntax enable

" Disable automatic folding
:set nofoldenable
