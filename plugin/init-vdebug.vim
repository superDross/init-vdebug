" init-vdebug.vim - initVdebug
" Author:      David Ross <https://github.com/superDross>
" Version:     0.1

function! GetDebuggerCmd(lang, ...)
  if a:1 ==# '.'
    let file = expand('%:p')
  else
    let file = a:000[0]
  endif
  if a:lang =~# 'python'
    let cmd = '!' . a:lang . ' ~/.vim/debuggers/' . a:lang .
             \'/pydbgp -d localhost:9000 ' . file . ' &'
    :silent VdebugStart
    :silent !sleep 0.1
    :silent exec cmd
    :redraw!
  endif
endfunction

" :DebugPy3 ~/somefile.py
" :DebugPy3 .
command! -nargs=1 DebugPy2 :call GetDebuggerCmd("python2", <f-args>)
command! -nargs=1 DebugPy3 :call GetDebuggerCmd("python3", <f-args>)

nnoremap <Leader>d :VdebugStart<CR>:!sleep 0.1<CR>:DebugPy3 .<CR><CR>
