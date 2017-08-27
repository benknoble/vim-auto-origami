if exists("g:autoloaded_auto_origami")
  finish
endif

let g:autoloaded_auto_origami = 1

let s:save_cpo = &cpo
set cpo&vim

" Revised from
" http://stackoverflow.com/questions/8757168/gvim-automatic-show-foldcolumn-when-there-are-folds-in-a-file
function! auto_origami#Foldcolumn()

  let l:old_belloff=&belloff " save belloff setting
  set belloff=error " don't beep when we cause an error
  let l:winview=winsaveview() "save window and cursor position

  let l:foldsexist=s:Has_Folds_Inner()

  let l:retval=g:auto_origami_default
  if l:foldsexist
    let l:retval=g:auto_origami_foldcolum
  else
    "Move to the end of the current fold and check again in case the
    "cursor was on the sole fold in the file when we checked
    if line('.')!=1
      :norm [z
      :norm k
    else
      :norm ]z
      :norm j
    endif
    let l:foldsexist=s:Has_Folds_Inner()
    if l:foldsexist
      let l:retval=g:auto_origami_foldcolum
    endif
  end

  let &belloff=l:old_belloff
  call winrestview(l:winview) "restore window/cursor position

  return l:retval
endfunction

"Attempt to move between folds, checking line numbers to see if it worked.
"If it did, there are folds.
function! s:Has_Folds_Inner()
  if foldlevel(line('.')) > 0
    return 1
  endif
  let l:origline=line('.')
  :norm zk
  if l:origline==line('.')
    :norm zj
    if l:origline==line('.')
      return 0
    else
      return 1
    endif
  else
    return 1
  endif
  return 0
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
