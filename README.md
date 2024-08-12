# .dotfiles

My dotfiles, managed with `make`.

## Neovim

### Install Treesitter stuff

```sh
luarocks --force-lock --lua-version=5.1 --tree=$HOME/.local/share/nvim/rocks --dev install tree-sitter-*
```
