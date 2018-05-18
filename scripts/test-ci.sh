#! /usr/bin/env bash

set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
plugin_dir="$( dirname "$dir" )"

check_vim8() {
  # check for version 8
  vim --version | grep -q 'IMproved 8'
}

run_tests() {
  vim -Nu <(cat << VIMRC
set rtp+=$plugin_dir/vader
set rtp+=$plugin_dir
VIMRC
  ) -c "Vader! ${plugin_dir}/test/*" > /dev/null
}

main() {
  check_vim8
  run_tests
}

main
