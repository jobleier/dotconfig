source ~/.vim/config.vim
source ~/.vim/functions.vim
source ~/.vim/plugins.vim
source ~/.vim/filetype.vim

"KITcar: {{{
"autocmd BufRead,BufNewFile,BufEnter */kitcar-*/* setlocal expandtab shiftwidth=2 tabstop=2
"autocmd BufRead,BufNewFile */kitcar-*/* setlocal tags+=../..tags,msg-tags,./msg-tags,../../msg-tags
"autocmd BufRead,BufNewFile */kitcar-bus-system/* setlocal path+=~/KITcar/kitcar-bus-system/**|let g:ale_linters = {'cpp': ['clangtidy']}
"let g:clang_format#command="clang-format-3.6"
"let g:clang_format#detect_style_file=1
"}}}

"Masterarbeit: {{{
"augroup masterthesis
"  au!
"  au filetype gtest setlocal errorformat^=test_%*\\w:\ %f:%l:\ %m
"  au filetype gtest setlocal errorformat^=%E%f:%l:\ Failure,%C%m,%+Z%m
"  au BufRead,BufNewFile */thesis_template_latex/* setlocal textwidth=0
"augroup END
"}}}

