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

# check argument
if [[ -f $1 ]]; then
  filepath=$1
else
  echo "no file provided"
  exit 1
fi

# determine file name without full path
filename=$(basename $filepath)

# examine file type and determine comment symbol
if [[ $filename == CMakeLists.txt || $filename == *.cmake || $filename == *.sh ]]; then
  comment="##"
elif [[ $filename == *.h || $filename == *.h.in || $filename == *.cc ]]; then
  comment="\/\/" # note: escape the forward slashes
elif [[ $fileext == *.rst ]]; then
  comment=".."
else
  exit 0 # no license header for this file
fi

# get the year the file is added to the repository
yearadded=$(git log --diff-filter=A --follow --find-renames=90% --format=%ad --date=format:'%Y' -- $filepath | tail -n 1)

# get the year of the last modification of the file
yearlastmod=$(git log --format="%ad" --date=format:'%Y' --max-count=1 -- $filepath)

# generate range of years for license header
if [[ "$yearadded" == "$yearlastmod" ]]; then
  years=$yearadded
else
  years=$yearadded-$yearlastmod
fi

# generate correct license header
sed -e "s/\${comment}/$comment/" -e "s/\${years}/$years/" ./utilities/license-header/template-license-header > correct-license-header

# determine number of lines of correct license header
headerlines=$(wc -l < ./utilities/license-header/template-license-header)

# check for shebang in first line
if [[ $(head -c 2 $filepath) == "#!" ]]; then
  shebang=1
else
  shebang=0
fi

# get number of different lines
numlinediff=$(sed -n "$((1+$shebang)),$(($headerlines+$shebang)) p" $filepath | diff --side-by-side --suppress-common-lines correct-license-header - | wc -l)

# print warning and correct header if non-compliant license header found
if [[ ! $numlinediff == 0 ]]; then
  echo "---"
  echo "Warning: Non-compliant license header for file: '$filepath'"
  echo "The correct license header reads:"
  cat correct-license-header
fi

# remove generated correct license header
rm correct-license-header
