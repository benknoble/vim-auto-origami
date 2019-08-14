#! /usr/bin/env bash

set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
plugin_dir="$( dirname "$dir" )"

run_tests() {
  vim -Nu <(cat << VIMRC
set rtp+=$plugin_dir
VIMRC
  ) -c "Vader! ${plugin_dir}/test/*" > /dev/null
}

main() {
  run_tests
}

main
