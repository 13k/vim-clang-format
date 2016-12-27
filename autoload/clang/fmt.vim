" fmt.vim: Vim command to format files with clang-format.
" Based on vim-go's fmt.vim.
" (https://github.com/fatih/vim-go/blob/master/autoload/go/fmt.vim)
"
" Options:
"
"   g:clang_format_path [default="clang-format"]
"
"       Flag naming the clang-format binary path.
"
"   g:clang_format_fallback_style [default=""]
"
"       Flag naming the fallback format.
"
"   g:clang_format_vim [default="clang-format.py"]
"
"       Flag naming the clang-format vim integration python script.
"
"   g:clang_shared_paths [default=['/usr/share/clang', '/usr/local/share/clang']]
"
"       Flag naming the clang shared paths to search for the vim integration
"       script.
"
"   g:clang_format_fail_silently [default=0]
"
"       Flag to ignore clang-format errors.
"
"   g:clang_format_autosave [default=1]
"
"       Flag to auto call :Fmt when saved file
"

function! clang#fmt#Format()
  let shared_paths = get(g:, "clang_shared_paths")
  let script_name = get(g:, "clang_format_vim")
  let intgr_script = clang#path#FindIntegrationScript(shared_paths, script_name)

  if empty(intgr_script)
    return
  endif

  " Execute the integration
  exe "pyf " . intgr_script
endfunction

function! clang#fmt#ToggleFmtAutoSave()
  if get(g:, "clang_format_autosave", 1)
    let g:clang_format_autosave = 0
    call clang#util#EchoProgress("auto fmt disabled")
    return
  end

  let g:clang_format_autosave = 1
  call clang#util#EchoProgress("auto fmt enabled")
endfunction

" vim: sw=2 ts=2 et
