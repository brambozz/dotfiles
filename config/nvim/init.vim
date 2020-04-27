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

" Nice colored column 72 to keep everything readable
:set colorcolumn=72

:let g:tex_flavor = 'latex'

" Plugin manager: vim-plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'lervag/vimtex'
Plug 'psf/black'
call plug#end()

" Disable automatic folding
:set nofoldenable
