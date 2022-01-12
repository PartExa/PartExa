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

# load helper functions
source $SOURCE_DIR/utilities/license-header/helper-functions.sh

# check for uncommitted changes
if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
  echo "The git repository contains uncommitted changes!"
  exit 1
fi

# get all changed files on current branch with respect to master branch
relevant_files=$(git diff --name-only --diff-filter=ACMR origin/master...HEAD 2>/dev/null)

# check license header of relevant files
for file in $relevant_files; do

  # get comment symbol for file
  comment=$(get_comment_symbol_of_file_type $file)
  if [[ -z $comment ]]; then
    continue
  fi

  # get the year the file is added to the repository
  yearadded=$(git log --diff-filter=A --follow --find-renames=90% --format=%ad --date=format:'%Y' -- $file | tail -n 1)

  # get the year of the last modification of the file
  yearlastmod=$(git log --format="%ad" --date=format:'%Y' --max-count=1 -- $file)

  # set current year if the file is not in the repository yet
  if [[ -z "$yearadded" ]]; then
    yearadded=$(date +"%Y")
    yearlastmod=$yearadded
  fi

  # get range of years
  years=$(generate_range_of_years $yearadded $yearlastmod)

  # check license header 
  $SOURCE_DIR/utilities/license-header/check-license-header.sh $file $comment $years

done
