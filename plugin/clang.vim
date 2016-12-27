if exists("g:clang_format_init")
  finish
endif

let g:clang_format_init = 1

if !exists("g:clang_format_vim")
  let g:clang_format_vim = "clang-format.py"
endif

if !exists("g:clang_shared_paths")
  let g:clang_shared_paths = ["/usr/share/clang", "/usr/local/share/clang"]
endif

if !exists("g:clang_format_fail_silently")
  let g:clang_format_fail_silently = 0
endif

if !exists("g:clang_format_autosave")
  let g:clang_format_autosave = 1
endif

augroup vim-clang-format
  autocmd!

  autocmd FileType * call clang#cmd#UninstallAutocommands()
  autocmd FileType c call clang#cmd#InstallAutocommands()
  autocmd FileType cpp call clang#cmd#InstallAutocommands()
  autocmd FileType java call clang#cmd#InstallAutocommands()
  autocmd FileType javascript call clang#cmd#InstallAutocommands()
  autocmd FileType objc call clang#cmd#InstallAutocommands()
  autocmd FileType proto call clang#cmd#InstallAutocommands()
  autocmd FileType typescript call clang#cmd#InstallAutocommands()
augroup END

" vim: sw=2 ts=2 et
