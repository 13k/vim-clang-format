function! clang#cmd#InstallCommands()
  command! -nargs=0 ClangFmt call clang#fmt#Format()
  command! -nargs=0 ClangFmtAutoSaveToggle call clang#fmt#ToggleFmtAutoSave()
endfunction

function! clang#cmd#InstallAutocommands()
  augroup vim-clang-format-filetype
    autocmd!
    autocmd BufWritePre <buffer> call clang#cmd#FmtAutosave()
  augroup END
endfunction

function! clang#cmd#UninstallAutocommands()
  augroup vim-clang-format-filetype
    autocmd!
  augroup END
endfunction

function! clang#cmd#FmtAutosave()
  if get(g:, "clang_format_autosave", 0)
    call clang#fmt#Format()
  endif
endfunction

" vim: sw=2 ts=2 et
