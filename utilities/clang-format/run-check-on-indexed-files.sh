#!/bin/bash
## ---------------------------------------------------------------------
##
## PartExa - A Particle Library for the Exa-Scale
##
## Copyright (C) 2022 by the PartExa authors
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program. If not, see <https://www.gnu.org/licenses/>.
##
## ---------------------------------------------------------------------

# get source directory
SOURCE_DIR="$(git rev-parse --show-toplevel 2>/dev/null)"

# check for correct source directory
if [[ ! -f ${SOURCE_DIR}/CMakeLists.txt ]]; then
  echo "This script must be run from within the git repository!"
  exit 1
fi

# change to source directory
cd $SOURCE_DIR

# get all indexed files
relevant_files=$(git diff-index --cached --name-only --diff-filter=ACMR HEAD 2>/dev/null)

# check formatting of relevant files
for file in $relevant_files; do
  if [[ $file == *.cpp || $file == *.cc || $file == *.H || $file == *.h || $file == *.hpp ]]; then
    clang-format -style=file -i $file
  fi
done
