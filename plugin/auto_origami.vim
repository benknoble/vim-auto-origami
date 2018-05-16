" auto_origami.vim      Automatically setting your foldcolumn, whenever you want!
" Maintainer:           David Knoble
"                       github @benknoble

if exists("g:loaded_auto_origami") || &compatible
  finish
endif

let g:loaded_auto_origami = 1

if !has("folding")
  echohl ErrorMsg
  echom "Auto Origami needs the +folding feature!"
  echohl None
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

let g:auto_origami_foldcolumn = get(g:, 'auto_origami_foldcolumn', 2)

let g:auto_origami_default = get(g:, 'auto_origami_default', 0)

command AutoOrigamiFoldColumn let &foldcolumn = auto_origami#Foldcolumn()

let &cpo = s:save_cpo
unlet s:save_cpo
