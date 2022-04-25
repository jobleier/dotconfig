"Using right grep (git grep if possible)
"{{{
function! SetGrepPrg(ignorecase)
    let g:gitroot=system('git rev-parse --show-cdup')
    if v:shell_error
        if a:ignorecase
            let g:mygrepprg="grep\\ -nir"
        else
            let g:mygrepprg="grep\\ -nr"
        endif
        "let g:grepcmd="silent! grep " . a:args . " ." 
    else
        if a:ignorecase
            let g:mygrepprg="git\\ grep\\ -ni"
        else
            let g:mygrepprg="git\\ grep\\ -n"
        endif
        "let g:grepcmd="silent! grep " . a:args . g:gitroot
    endif

    exec "setlocal grepprg=" . g:mygrepprg
endfunction

augroup grepprg
  au!
  au BufRead,BufNewFile * call SetGrepPrg(0)
augroup END
"}}}

"Use dict to translate words
"{{{
function! Translate(word)
  let x=system('dict ' . a:word)
  "split
  "put=x
  echo x
endfunction
command! -nargs=1 Translate call Translate(<f-args>)
"}}}
