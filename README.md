# vim-auto-origami

[![This project is considered finished](https://img.shields.io/badge/status-finished-success.svg)](https://benknoble.github.io/status/finished/)

Automatically set vim's 'foldcolumn' when folds present

Check it out on [vim.org](http://www.vim.org/scripts/script.php?script_id=5601)
too.

## Installation

I recommend using [Pathogen](https://github.com/tpope/vim-pathogen) for managing
plugins.

Then it's just a quick

```bash
cd ~/.vim/bundle
git clone https://github.com/benknoble/vim-auto-origami.git
```

## Quickstart

Drop the following in your vimrc, and open a file with some folds
```vim
augroup autofoldcolumn
  au!

  " Or whatever autocmd-events you want
  au CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
augroup END
```

## Usage

Check out the docs (`:help auto-origami`).
