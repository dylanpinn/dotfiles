" Use jq to format JSON files.
if executable('jq')
  setlocal formatprg=jq
endif
