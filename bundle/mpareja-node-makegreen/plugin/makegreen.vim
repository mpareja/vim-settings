" plugin/makegreen.vim
" Author:   Rein Henrichs <reinh@reinh.com>
" License:  MIT License

" Install this file as plugin/makegreen.vim.

" ============================================================================

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if &cp || exists("g:makegreen_loaded") && g:makegreen_loaded
  finish
endif
let g:makegreen_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

hi GrayBar term=reverse ctermfg=white ctermbg=yellow guifg=white guibg=yellow
hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=white guibg=green
hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=red

function MakeGreen(...) "{{{1
  let arg_count = a:0

  redraw!
  call s:Bar("gray", "Running tests... (CTRL-C, CTRL-L if hung)")

  call system("npm test")
  echo "blah"

  redraw!

  if v:shell_error
    call s:Bar("red", "Test failure(s)")
  else
    call s:Bar("green","All tests passed")
  endif

endfunction
"}}}1
"
" Utility Functions" {{{1
function s:GetFirstError()
  if getqflist() == []
    return ''
  endif

  for error in getqflist()
    if error['valid']
      break
    endif
  endfor
  if ! error['valid']
    return ''
  endif
  let error_message = substitute(error['text'], '^ *', '', 'g')
  let error_message = substitute(error_message, "\n", ' ', 'g')
  let error_message = substitute(error_message, "  *", ' ', 'g')
  return error_message
endfunction

function s:Bar(type, msg)
  if a:type == "red"
    echohl RedBar
  elseif a:type == "gray"
	echohl GrayBar
  else
    echohl GreenBar
  endif
  echon a:msg repeat(" ", &columns - strlen(a:msg) - 12)
  echohl None
endfunction

:command -nargs=* MakeGreen :call MakeGreen(<q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set sw=2 sts=2
