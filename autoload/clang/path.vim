" FindIntegrationScript checks if the vim integration exists in any of the given
" shared paths or not and returns it.
" It returns an empty string if it doesn't exist.
function! clang#path#FindIntegrationScript(paths, script_name)
  for path in a:paths
    let path = substitute(path, "/?$", "", "")
    let search_path = path . "/**"
    let script_path = findfile(a:script_name, search_path)

    if !empty(script_path)
      return script_path
    endif
  endfor

  echo "vim-clang-format: could not find '" . a:script_name . "'."
  return ""
endfunction

" vim: sw=2 ts=2 et
