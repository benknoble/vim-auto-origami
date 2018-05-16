#! /usr/bin/env bash

set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
plugin_dir="$( dirname "$dir" )"

install_vim8() {
  curl https://raw.githubusercontent.com/kana/vim-version-manager/master/bin/vvm | python - setup; true
  source ~/.vvm/etc/login
  vvm update_itself
  vvm use vimorg--v8.0.1529 --install --with-features=huge
}

install_vader() {
  git clone https://github.com/junegunn/vader.vim.git "$plugin_dir/vader"
}

install() {
  install_vim8
  install_vader
}

main() {
  install
}

main
