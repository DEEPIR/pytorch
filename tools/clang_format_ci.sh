#!/bin/sh
set -eux

# Runs clang-format on whitelisted files.
# Requires a single argument, which is the <commit> argument to git-clang-format

# If you edit this whitelist, please edit the one in clang_format_all.py as well
find . -type f -print0 \
  -path './torch/csrc/jit/*' -or \
  -path './test/cpp/jit/*' -or \
  -path './test/cpp/tensorexpr/*' \
  | xargs tools/git-clang-format --verbose "$1" --
