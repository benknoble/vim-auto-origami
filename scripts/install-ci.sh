#! /usr/bin/env bash

set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
plugin_dir="$( dirname "$dir" )"

install_vim8() {
  if [[ "$(uname)" = Darwin ]]; then
    brew update && brew install vim
  else
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt-get update
  fi
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
