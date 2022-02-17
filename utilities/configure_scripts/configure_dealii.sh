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

# It is recommended to copy this file to your deal.II build directory via
# ```bash
# cd <dealii_build>
# cp <partexa_source>/utilities/configure_scripts/configure_partexa.sh .
# ```

# Having copied the file, you need to adjust the paths specified below
P4EST=/path/to/p4est
DEAL=/path/to/dealii

cmake \
    -D CMAKE_BUILD_TYPE="DebugRelease" \
    -D CMAKE_CXX_FLAGS="-std=c++17 -march=native -Wno-array-bounds -Wno-literal-suffix -pthread" \
    -D DEAL_II_CXX_FLAGS_RELEASE="-O3" \
    -D DEAL_II_CXX_FLAGS_DEBUG="-Og" \
    -D CMAKE_C_FLAGS="-march=native -Wno-array-bounds" \
    -D DEAL_II_WITH_MPI:BOOL="ON" \
    -D DEAL_II_LINKER_FLAGS="-lpthread" \
    -D DEAL_II_WITH_64BIT_INDICES="ON" \
    -D DEAL_II_WITH_P4EST="ON" \
    -D P4EST_DIR="$P4EST" \
    -D DEAL_II_COMPONENT_DOCUMENTATION="OFF" \
    -D DEAL_II_COMPONENT_EXAMPLES="OFF" \
    $DEAL
