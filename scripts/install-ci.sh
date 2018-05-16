#! /usr/bin/env bash

set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
plugin_dir="$( dirname "$dir" )"

install_vader() {
  git clone https://github.com/junegunn/vader.vim.git "$plugin_dir/vader"
}

install() {
  install_vader
}

main() {
  install
}

main
