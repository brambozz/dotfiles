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

" Nice colored column 72 to keep everything nicely readabe
:set colorcolumn=72

:let g:tex_flavor = 'latex'

" Plugin manager: dein (refer to :h dein for instructions)
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Add plugins here
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('dracula/vim')
  call dein#add('lervag/vimtex')

  call dein#end()
  call dein#save_state()
endif

" filetype plugin indent on
syntax enable
color dracula

" Disable automatic folding
:set nofoldenable


let g:deoplete#enable_at_startup = 1

" Set latex completion
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\})
let g:vimtex_complete_close_braces = 1

