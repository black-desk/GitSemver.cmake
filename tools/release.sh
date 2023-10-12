#!/bin/bash

set -e
set -o pipefail

GIT=${GIT:="git"}

repoRoot="$("$GIT" rev-parse --show-toplevel)"
cd "$repoRoot"

version="$(git describe --tags)"

sed -i "s/WARNING \"GitSemver: --==Development Version==--\"/STATUS \"GitSemver: --==Version: ${version}==--\"/g" GitSemver.cmake
