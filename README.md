# vim-quickstatements

[QuickStatements](https://www.wikidata.org/wiki/Help:QuickStatements) syntax
for Vim.

## Install
### With [Pathogen](https://github.com/tpope/vim-pathogen#pathogenvim)

```bash
git clone https://github.com/bfontaine/vim-quickstatements.git ~/bundle/
```

### With [Vim-Plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'bfontaine/vim-plug'
```

### Manually

1. Grab [a zip](https://github.com/bfontaine/vim-quickstatements/archive/master.zip)
   of this repo
2. Move `ftdetect/quickstatements.vim` into `~/.vim/ftdetect/` and
   `syntax/quickstatements.vim` into `~/.vim/syntax/`

## Usage
There’s no official file extension for QuickStatements. This plugin recognize
the `.qs` extension only. You can always `set ft=quickstatements` on any file
by yourself.
