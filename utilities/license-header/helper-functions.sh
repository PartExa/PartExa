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

get_comment_symbol_of_file_type()
{
  if [[ -f $1 ]]; then
    filepath=$1
  else
    echo "No file provided!"
    exit 1
  fi

  # determine file name without full path
  filename=$(basename $filepath)

  # examine file type and determine comment symbol
  if [[ $filename == CMakeLists.txt || $filename == *.cmake || $filename == *.sh ]]; then
    comment="##"
  elif [[ $filename == *.h || $filename == *.h.in || $filename == *.cc ]]; then
    comment="\/\/"
  elif [[ $fileext == *.rst ]]; then
    comment=".."
  else
    comment=""
  fi

  echo $comment
}

generate_range_of_years()
{
  if [[ -n $1 && -n $2 ]]; then
    yearadded=$1
    yearlastmod=$2
  else
    echo "No year(s) provided!"
    exit 1
  fi

  if [[ "$yearadded" == "$yearlastmod" ]]; then
    years=$yearadded
  else
    years=$yearadded-$yearlastmod
  fi

  echo $years
}

exit 0
