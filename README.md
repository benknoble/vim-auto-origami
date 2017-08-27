# vim-auto-origami
Automatically set vim's 'foldcolumn' when folds present

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
  au CursorHold,BufWinEnter * let &foldcolumn = auto_origami#Foldcolumn()
augroup END
```

## Usage

Check out the docs (`:help auto-origami`).
