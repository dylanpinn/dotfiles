let g:projectionist_heuristics = {
  \ "*": {
  \   "*.ts": {
  \     "alternate": [
  \       "{dirname}/__tests__/{basename}.test.ts"
  \     ],
  \     "type": "source"
  \   },
  \   "**/__tests__/*.test.ts": {
  \     "alternate": "{dirname}/{basename}.ts",
  \     "type": "source"
  \   }
  \ }}
