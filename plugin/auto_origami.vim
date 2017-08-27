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

let &cpo = s:save_cpo
unlet s:save_cpo
