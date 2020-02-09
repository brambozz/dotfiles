" vi:syntax=vim

" This vim colorscheme is based on:
" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
"
" Add the following lines to init.vim to enable
" syntax enable
" set termguicolors
" color base16
"
" This file was tested only with terminal neovim

" %%base16_template: nvim##default %%
let s:gui00        = "282936"
let s:gui01        = "3a3c4e"
let s:gui02        = "4d4f68"
let s:gui03        = "626483"
let s:gui04        = "62d6e8"
let s:gui05        = "e9e9f4"
let s:gui06        = "f1f2f8"
let s:gui07        = "f7f7fb"
let s:gui08        = "ea51b2"
let s:gui09        = "b45bcf"
let s:gui0A        = "00f769"
let s:gui0B        = "ebff87"
let s:gui0C        = "a1efe4"
let s:gui0D        = "62d6e8"
let s:gui0E        = "b45bcf"
let s:gui0F        = "00f769"

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16-dracula"
" %%base16_template_end%%
" Highlight everything
function! g:Base16hi(group, guifg, guibg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction

" Vim editor colors
call g:Base16hi("Normal",	s:gui05, s:gui00)
call g:Base16hi("Bold",          "", "", "bold", "")
call g:Base16hi("Debug",         s:gui08, "")
call g:Base16hi("Directory",     s:gui0D, "")
call g:Base16hi("Error",         s:gui00, s:gui08)
call g:Base16hi("ErrorMsg",      s:gui08, s:gui00)
call g:Base16hi("Exception",     s:gui08, "")
call g:Base16hi("FoldColumn",    s:gui0C, s:gui01)
call g:Base16hi("Folded",        s:gui03, s:gui01)
call g:Base16hi("IncSearch",     s:gui01, s:gui09)
call g:Base16hi("Italic",        "", "", "italic", "")
call g:Base16hi("Macro",         s:gui08, "")
call g:Base16hi("MatchParen",    "", s:gui03)
call g:Base16hi("ModeMsg",       s:gui0B, "")
call g:Base16hi("MoreMsg",       s:gui0B, "")
call g:Base16hi("Question",      s:gui0D, "")
call g:Base16hi("Search",        s:gui01, s:gui0A)
call g:Base16hi("Substitute",    s:gui01, s:gui0A)
call g:Base16hi("SpecialKey",    s:gui03, "")
call g:Base16hi("TooLong",       s:gui08, "")
call g:Base16hi("Underlined",    s:gui08, "")
call g:Base16hi("Visual",        "", s:gui02)
call g:Base16hi("VisualNOS",     s:gui08, "")
call g:Base16hi("WarningMsg",    s:gui08, "")
call g:Base16hi("WildMenu",      s:gui08, s:gui0A)
call g:Base16hi("Title",         s:gui0D, "")
call g:Base16hi("Conceal",       s:gui0D, s:gui00)
call g:Base16hi("Cursor",        s:gui00, s:gui05)
call g:Base16hi("NonText",       s:gui03, "")
call g:Base16hi("LineNr",        s:gui04, s:gui01)
call g:Base16hi("SignColumn",    s:gui03, s:gui01)
call g:Base16hi("StatusLine",    s:gui04, s:gui02)
call g:Base16hi("StatusLineNC",  s:gui03, s:gui01)
call g:Base16hi("VertSplit",     s:gui02, s:gui02)
call g:Base16hi("ColorColumn",   "", s:gui01)
call g:Base16hi("CursorColumn",  "", s:gui01)
call g:Base16hi("CursorLine",    "", s:gui01)
call g:Base16hi("CursorLineNr",  s:gui04, s:gui01)
call g:Base16hi("QuickFixLine",  "", s:gui01)
call g:Base16hi("PMenu",         s:gui05, s:gui01)
call g:Base16hi("PMenuSel",      s:gui01, s:gui05)
call g:Base16hi("TabLine",       s:gui03, s:gui01)
call g:Base16hi("TabLineFill",   s:gui03, s:gui01)
call g:Base16hi("TabLineSel",    s:gui0B, s:gui01)

" Standard syntax highlighting
call g:Base16hi("Boolean",      s:gui09, "")
call g:Base16hi("Character",    s:gui08, "")
call g:Base16hi("Comment",      s:gui03, "")
call g:Base16hi("Conditional",  s:gui0E, "")
call g:Base16hi("Constant",     s:gui09, "")
call g:Base16hi("Define",       s:gui0E, "", "bold", "")
call g:Base16hi("Delimiter",    s:gui0F, "")
call g:Base16hi("Float",        s:gui09, "")
call g:Base16hi("Function",     s:gui0D, "")
call g:Base16hi("Identifier",   s:gui08, "", "none", "")
call g:Base16hi("Include",      s:gui0D, "")
call g:Base16hi("Keyword",      s:gui0E, "")
call g:Base16hi("Label",        s:gui0A, "")
call g:Base16hi("Number",       s:gui09, "")
call g:Base16hi("Operator",     s:gui05, "", "none", "")
call g:Base16hi("PreProc",      s:gui0A, "")
call g:Base16hi("Repeat",       s:gui0A, "")
call g:Base16hi("Special",      s:gui0C, "")
call g:Base16hi("SpecialChar",  s:gui0F, "")
call g:Base16hi("Statement",    s:gui08, "")
call g:Base16hi("StorageClass", s:gui0A, "")
call g:Base16hi("String",       s:gui0B, "")
call g:Base16hi("Structure",    s:gui0E, "")
call g:Base16hi("Tag",          s:gui0A, "")
call g:Base16hi("Todo",         s:gui0A, s:gui01)
call g:Base16hi("Type",         s:gui0A, "")
call g:Base16hi("Typedef",      s:gui0A, "")

" C highlighting
call g:Base16hi("cOperator",   s:gui0C, "")
call g:Base16hi("cPreCondit",  s:gui0E, "")

" C# highlighting
call g:Base16hi("csClass",                 s:gui0A, "")
call g:Base16hi("csAttribute",             s:gui0A, "")
call g:Base16hi("csModifier",              s:gui0E, "")
call g:Base16hi("csType",                  s:gui08, "")
call g:Base16hi("csUnspecifiedStatement",  s:gui0D, "")
call g:Base16hi("csContextualStatement",   s:gui0E, "")
call g:Base16hi("csNewDecleration",        s:gui08, "")

" CSS highlighting
call g:Base16hi("cssBraces",      s:gui05, "")
call g:Base16hi("cssClassName",   s:gui0E, "")
call g:Base16hi("cssColor",       s:gui0C, "")

" Diff highlighting
call g:Base16hi("DiffAdd",      s:gui0B, s:gui01)
call g:Base16hi("DiffChange",   s:gui03, s:gui01)
call g:Base16hi("DiffDelete",   s:gui08, s:gui01)
call g:Base16hi("DiffText",     s:gui0D, s:gui01)
call g:Base16hi("DiffAdded",    s:gui0B, s:gui00)
call g:Base16hi("DiffFile",     s:gui08, s:gui00)
call g:Base16hi("DiffNewFile",  s:gui0B, s:gui00)
call g:Base16hi("DiffLine",     s:gui0D, s:gui00)
call g:Base16hi("DiffRemoved",  s:gui08, s:gui00)

" Git highlighting
call g:Base16hi("gitcommitOverflow",       s:gui08, "")
call g:Base16hi("gitcommitSummary",        s:gui0B, "")
call g:Base16hi("gitcommitComment",        s:gui03, "")
call g:Base16hi("gitcommitUntracked",      s:gui03, "")
call g:Base16hi("gitcommitDiscarded",      s:gui03, "")
call g:Base16hi("gitcommitSelected",       s:gui03, "")
call g:Base16hi("gitcommitHeader",         s:gui0E, "")
call g:Base16hi("gitcommitSelectedType",   s:gui0D, "")
call g:Base16hi("gitcommitUnmergedType",   s:gui0D, "")
call g:Base16hi("gitcommitDiscardedType",  s:gui0D, "")
call g:Base16hi("gitcommitBranch",         s:gui09, "", "bold", "")
call g:Base16hi("gitcommitUntrackedFile",  s:gui0A, "")
call g:Base16hi("gitcommitUnmergedFile",   s:gui08, "", "bold", "")
call g:Base16hi("gitcommitDiscardedFile",  s:gui08, "", "bold", "")
call g:Base16hi("gitcommitSelectedFile",   s:gui0B, "", "bold", "")

" GitGutter highlighting
call g:Base16hi("GitGutterAdd",     s:gui0B, s:gui01)
call g:Base16hi("GitGutterChange",  s:gui0D, s:gui01)
call g:Base16hi("GitGutterDelete",  s:gui08, s:gui01)
call g:Base16hi("GitGutterChangeDelete",  s:gui0E, s:gui01)

" HTML highlighting
call g:Base16hi("htmlBold",    s:gui0A, "")
call g:Base16hi("htmlItalic",  s:gui0E, "")
call g:Base16hi("htmlEndTag",  s:gui05, "")
call g:Base16hi("htmlTag",     s:gui05, "")

" JavaScript highlighting
call g:Base16hi("javaScript",        s:gui05, "")
call g:Base16hi("javaScriptBraces",  s:gui05, "")
call g:Base16hi("javaScriptNumber",  s:gui09, "")
" pangloss/vim-javascript highlighting
call g:Base16hi("jsOperator",          s:gui0D, "")
call g:Base16hi("jsStatement",         s:gui0E, "")
call g:Base16hi("jsReturn",            s:gui0E, "")
call g:Base16hi("jsThis",              s:gui08, "")
call g:Base16hi("jsClassDefinition",   s:gui0A, "")
call g:Base16hi("jsFunction",          s:gui0E, "")
call g:Base16hi("jsFuncName",          s:gui0D, "")
call g:Base16hi("jsFuncCall",          s:gui0D, "")
call g:Base16hi("jsClassFuncName",     s:gui0D, "")
call g:Base16hi("jsClassMethodType",   s:gui0E, "")
call g:Base16hi("jsRegexpString",      s:gui0C, "")
call g:Base16hi("jsGlobalObjects",     s:gui0A, "")
call g:Base16hi("jsGlobalNodeObjects", s:gui0A, "")
call g:Base16hi("jsExceptions",        s:gui0A, "")
call g:Base16hi("jsBuiltins",          s:gui0A, "")

" Mail highlighting
call g:Base16hi("mailQuoted1",  s:gui0A, "")
call g:Base16hi("mailQuoted2",  s:gui0B, "")
call g:Base16hi("mailQuoted3",  s:gui0E, "")
call g:Base16hi("mailQuoted4",  s:gui0C, "")
call g:Base16hi("mailQuoted5",  s:gui0D, "")
call g:Base16hi("mailQuoted6",  s:gui0A, "")
call g:Base16hi("mailURL",      s:gui0D, "")
call g:Base16hi("mailEmail",    s:gui0D, "")

" Markdown highlighting
call g:Base16hi("markdownCode",              s:gui0B, "")
call g:Base16hi("markdownError",             s:gui05, s:gui00)
call g:Base16hi("markdownCodeBlock",         s:gui0B, "")
call g:Base16hi("markdownHeadingDelimiter",  s:gui0D, "")

" NERDTree highlighting
call g:Base16hi("NERDTreeDirSlash",  s:gui0D, "")
call g:Base16hi("NERDTreeExecFile",  s:gui05, "")

" PHP highlighting
call g:Base16hi("phpMemberSelector",  s:gui05, "")
call g:Base16hi("phpComparison",      s:gui05, "")
call g:Base16hi("phpParent",          s:gui05, "")
call g:Base16hi("phpMethodsVar",      s:gui0C, "")

" Python highlighting
call g:Base16hi("pythonOperator",  s:gui0E, "")
call g:Base16hi("pythonRepeat",    s:gui0E, "")
call g:Base16hi("pythonInclude",   s:gui0E, "")
call g:Base16hi("pythonStatement", s:gui0E, "")

" Ruby highlighting
call g:Base16hi("rubyAttribute",               s:gui0D, "")
call g:Base16hi("rubyConstant",                s:gui0A, "")
call g:Base16hi("rubyInterpolationDelimiter",  s:gui0F, "")
call g:Base16hi("rubyRegexp",                  s:gui0C, "")
call g:Base16hi("rubySymbol",                  s:gui0B, "")
call g:Base16hi("rubyStringDelimiter",         s:gui0B, "")

" SASS highlighting
call g:Base16hi("sassidChar",     s:gui08, "")
call g:Base16hi("sassClassChar",  s:gui09, "")
call g:Base16hi("sassInclude",    s:gui0E, "")
call g:Base16hi("sassMixing",     s:gui0E, "")
call g:Base16hi("sassMixinName",  s:gui0D, "")

" Signify highlighting
call g:Base16hi("SignifySignAdd",     s:gui0B, s:gui01)
call g:Base16hi("SignifySignChange",  s:gui0D, s:gui01)
call g:Base16hi("SignifySignDelete",  s:gui08, s:gui01)

" Spelling highlighting
call g:Base16hi("SpellBad",     "", "", "undercurl", s:gui08)
call g:Base16hi("SpellLocal",   "", "", "undercurl", s:gui0C)
call g:Base16hi("SpellCap",     "", "", "undercurl", s:gui0D)
call g:Base16hi("SpellRare",    "", "", "undercurl", s:gui0E)

" Startify highlighting
call g:Base16hi("StartifyBracket",  s:gui03, "")
call g:Base16hi("StartifyFile",     s:gui07, "")
call g:Base16hi("StartifyFooter",   s:gui03, "")
call g:Base16hi("StartifyHeader",   s:gui0B, "")
call g:Base16hi("StartifyNumber",   s:gui09, "")
call g:Base16hi("StartifyPath",     s:gui03, "")
call g:Base16hi("StartifySection",  s:gui0E, "")
call g:Base16hi("StartifySelect",   s:gui0C, "")
call g:Base16hi("StartifySlash",    s:gui03, "")
call g:Base16hi("StartifySpecial",  s:gui03, "")

" Java highlighting
call g:Base16hi("javaOperator",     s:gui0D, "")

" Remove functions
delf g:Base16hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
