"keine erzwungene Kompatibilität zu vi
set nocompatible
filetype plugin on
filetype indent on

"Tabweite auf 2 Zeichen setzen
set shiftwidth=2
set tabstop=2
set expandtab
"Ersetze Tabs durch Leerzeichen

"Textbreite auf 120 Zeichen setzen
set textwidth=120

"nicht innerhalb eines Wortes umbrechen
set wrap
set linebreak

"automatisch einrücken
set autoindent
set smartindent
set copyindent
set smarttab

"Zeilennummern anzeigen
set number
set relativenumber

"Zeichencodierung setzen
set encoding=utf-8

"Erlaube Wechsel zwischen Puffern ohne speichern zu müssen
set hidden

"Textstellen suche
set hlsearch "Markiere bei Suche alle gefundenen Textstellen
set incsearch "Beginne Suche während der Eingabe

"Sprachen für Rechtschreibprüfung
set spelllang=de,en
set nospell

"Autovervollständigung im Kommandomodus
set wildmode=list:longest "Vervollständige soweit wie möglich und liste dann Möglichkeiten
set wildignore=*.swp,*.aux,*.class,*.o,*.lst,*_8cpp*,*_8h*,*.pyc "ignoriere bei Auflistung
set wildmenu "Liste zum durchspringen mit <C-n> und <C-p>

"Faltung des Codes bzw. des Textes
set foldmethod=syntax "Code nach Syntax falten
set nofoldenable "Code nach Laden nicht automatisch laden

"benutze Pastemode, um im INSERT-Modus Text ohne Kaskadeneffekt einfügen zu können
set pastetoggle=<F2>

set completeopt=menuone,preview
"Omni completion
set omnifunc=syntaxcomplete#Complete

"setze default-Shell
"set shell=bash\ --rcfile\ ~/dotfiles/bash/vim.bashrc
"using env variable to indicate shell is running inside vim
"needs that $SHELL is set
let $PROMPT_PREFIX.="VIM "
set shell=$SHELL

"scrolle 5 Zeilen bevor der Cursor am Bildschirmrand ist
set scrolloff=4

"markiere Blöcke, bei denen Zeichen fehlen
set virtualedit=block

"setze Funktionalität von . auf _
"nnoremap _ .
"benutze . als : in Normal mode
"nnoremap . :

"benutze ö als : in Normal mode
nnoremap ö :

"benutze ä als / in Normal mode
nnoremap ä /

"vertausche , und ;
nnoremap , ;
nnoremap ; ,

"Verhalten von Y wie von C oder D
nnoremap Y y$

"Verwende <C-h>, ... zum Navigieren durch die Fenster
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Falls sudo vergessen: verwende w!!
cmap w!! w !sudo tee % >/dev/null
cmap please w !sudo tee % >/dev/null

" springe zum richtigen Window wenn zu einer Datei gesprungen wird (gilt für ...)
set swb=useopen

"colorscheme atom
set background=light
hi Todo cterm=none ctermfg=black ctermbg=cyan
hi Search cterm=bold ctermfg=white ctermbg=red
hi Folded cterm=bold ctermfg=green ctermbg=white

if has('gui_running')
  colorscheme solarized
endif

command! B execute "b#"

" Highlight matches when jumping to next 
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" EITHER blink the line containing the match...
function! HLNext (blinktime)
  set invcursorline 
  redraw
  exec 'sleep ' . float2nr(100) . 'm'
  set invcursorline
  redraw
endfunction

"expand %% to %:h in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/': '%%'

" Groß-/Kleinschreibung des letzten Worts ändern ohne insert-Mode zu verlassen
imap <C-t> <Esc>m`b~``a

set path-=/usr/include
set path+=**

" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Make the 81st column stand out 
highlight ColorColumn ctermbg=grey
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%121v', 100)

set tags+=~/.tags/cpp.tags,~/.tags/ros.tags,~/.tags/ros.msgs.tags

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

xnoremap <C-a>  <C-a>gv
xnoremap <C-x>  <C-x>gv

" visual around last input
nnoremap gV `[V`]

command! W w

" inside and around following characters
for char in ['=', '`' , '*']
  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor
" around includes only the following character
for char in [ ',', ';', '/', '+' , '_' ]
  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
  execute 'xnoremap a' . char . ' :<C-u>normal! T' . char . 'vf' . char . '<CR>'
  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

set undofile
set undodir=~/.vim/undodir
