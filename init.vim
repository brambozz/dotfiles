"vimrc file Bram de Wilde, see GitHub for changelog 
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

" Keys that still need remapping (because they have been overwritten)
" n. These will go to spots h and j, but first see their functions. 
" Hopefully, nothing else will have to be removed.

" Display line numbers
:set number

:set colorcolumn=72

" Plugin manager: dein
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
