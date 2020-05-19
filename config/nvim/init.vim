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
Plug 'andymass/vim-matchup'
Plug 'psf/black'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

" Execute Black at write on .py files
autocmd BufWritePre *.py execute ':Black' 

" Disable automatic folding
:set nofoldenable

" Us matchup in vimtex 
let g:matchup_override_vimtex = 1

" This makes visual mode selection left/right more responsive
:set timeoutlen=100 

" Limelight color config
let g:limelight_conceal_ctermfg = 'gray'

"let g:deoplete#enable_at_startup = 1

" Set latex completion
"call deoplete#custom#var('omni', 'input_patterns', {
"	\ 'tex': g:vimtex#re#deoplete
"	\})
"let g:vimtex_complete_close_braces = 1

" Color settings
:syntax enable
:set termguicolors
:colorscheme base16
