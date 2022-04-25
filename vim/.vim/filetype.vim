"Python: {{{
autocmd filetype python setlocal expandtab shiftwidth=4 tabstop=4
"}}}

"CPP: {{{
"autocmd filetype cpp source ~/dotfiles/vim/bundle/googletest-syntax/syntax/googletest.vim
"}}}

"CSV: {{{
augroup filetypedetect
  au BufRead,BufNewFile *.csv,*.dat setfiletype csv
augroup END

if exists("did_load_csvfiletype")
	finish
endif
let did_load_csvfiletype=1
"}}}

"Mail: {{{
augroup filetypedetect
	au! BufNewFile,BufRead /tmp/mutt* setlocal fo+=aw textwidth=80
	au! BufNewFile,BufRead */mutt_tmp/* setlocal fo+=aw textwidth=80
augroup END
"}}}

"Vim: {{{
autocmd filetype vim setlocal fdm=marker
"}}}

