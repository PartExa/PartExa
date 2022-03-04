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

# You may want to deactivate this line
rm -rf CMakeFiles/ CMakeCache.txt

# It is recommended to copy this file to your PartExa build directory.

# Having copied the file, you need to adjust the paths specified below
PARTEXA_SOURCE=/path/to/partexa
DEAL_BUILD_OR_INSTALL=/path/to/dealii

# You may want to switch between Debug/Release mode
cmake \
    -D CMAKE_BUILD_TYPE="Release" \
    -D BUILD_SHARED_LIBS=OFF \
    -D DEAL_II_DIR="$DEAL_BUILD_OR_INSTALL" \
    $PARTEXA_SOURCE
