if exists("g:loaded_auto_origami")
  finish
endif

let g:loaded_auto_origami = 1

if !has("folding")
  echohl ErrorMsg
  echom "Auto Origami needs the +folding feature!"
  echohl None
endif

let s:save_cpo = &cpo
set cpo&vim

if !exists("g:auto_origami_foldcolum")
  let g:auto_origami_foldcolum = 2
endif

if !exists("g:auto_origami_default")
  let g:auto_origami_default = 0
endif

command AutoOrigamiFoldColumn let &foldcolumn = auto_origami#Foldcolumn()

let &cpo = s:save_cpo
unlet s:save_cpo
