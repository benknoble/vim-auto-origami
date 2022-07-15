" auto_origami.vim      Automatically setting your foldcolumn, whenever you want!
" Maintainer:           David Knoble
"                       github @benknoble

if exists("g:autoloaded_auto_origami")
  finish
endif

let g:autoloaded_auto_origami = 1

let s:save_cpo = &cpo
set cpo&vim

" Revised from
" http://stackoverflow.com/questions/8757168/gvim-automatic-show-foldcolumn-when-there-are-folds-in-a-file
function! auto_origami#Foldcolumn()

  " Early exit: if 'nofoldenable' set, return the default value
  if ! &foldenable
    return g:auto_origami_default
  endif

  let l:old_belloff=&belloff  " save belloff setting
  set belloff=error           " don't beep when we cause an error
  let l:winview=winsaveview() " save window and cursor position

  let l:foldcolumn = s:HasFolds() ?
        \ g:auto_origami_foldcolumn :
        \ g:auto_origami_default

  let &belloff=l:old_belloff  " restore belloff setting
  call winrestview(l:winview) " restore window/cursor position

  return l:foldcolumn
endfunction

function! s:HasFolds()
  let l:foldsexist=s:HasFoldsInner()

  if l:foldsexist
    return v:true
  else
    " Move to the end of the current fold and check again in case the
    " cursor was on the sole fold in the file when we checked
    if line('.')!=1
      keepjumps normal! [z
      keepjumps normal! k
    else
      keepjumps normal! ]z
      keepjumps normal! j
    endif
    let l:foldsexist=s:HasFoldsInner()
    if l:foldsexist
      return v:true
    endif
  end

  return v:false
endfunction

" Attempt to move between folds, checking line numbers to see if it worked.
" If it did, there are folds.
function! s:HasFoldsInner()
  if foldlevel(line('.')) > 0
    return 1
  endif
  let l:origline=line('.')
  keepjumps normal! zk
  if l:origline==line('.')
    keepjumps normal! zj
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
