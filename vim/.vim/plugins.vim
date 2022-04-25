"vim-latexsuit {{{
au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

"disable auto folding for LaTeX
let g:tex_fold_enabled=0
autocmd Filetype tex setlocal nofoldenable
"}}}

"vim-evince-synctex: {{{
nnoremap <leader>lf :VimtexForwardSearch<CR>
command! Gotopdf call Tex_myForwardSearchLaTeX()
"}}}

" OmniCppComplete: {{{
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
"}}}

"Taglist: {{{
"open taglist in window at right border
let Tlist_Use_Right_Window=1
let tlist_tex_settings   = 'Tex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'
"}}}

" LimeLight: {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'grey'
"let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
"let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.3

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^$'
let g:limelight_eop = '^$'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"}}}

" GcovMarker: {{{
let g:gcov_marker_auto_lopen = 0
let g:gcov_marker_covered = '>>'
let g:gcov_marker_uncovered = '>>'
let g:gcov_marker_path = '., ../../build/**' 
"../../build/coverage-gcov/'
highlight! GcovUncoveredText term=reverse cterm=bold ctermbg=red guifg=White guibg=Red
highlight! GcovCoveredText   term=reverse cterm=bold ctermbg=green guifg=White guibg=Red
"}}}

"Rainbow: {{{
  let g:rainbow_conf = {
    \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \ 'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta'],
    \ 'operators': '_,_',
    \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \ 'separately': {
    \   '*': {},
    \   'tex': {
    \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \   },
    \   'lisp': {
    \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \   },
    \   'vim': {
    \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \   },
    \   'html': {
    \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \   },
    \   'css': 0,
    \ }
    \}
"}}}
