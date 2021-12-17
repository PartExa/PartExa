## ---------------------------------------------------------------------
##
## PartExa - A Particle Library for the Exa-Scale
##
## Copyright (C) 2021 by the PartExa authors
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

FIND_PROGRAM(SPHINX_EXECUTABLE
  NAMES sphinx-build
  DOC "Path to sphinx-build executable"
  )

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(Sphinx
  "Failed to find sphinx-build executable"
  SPHINX_EXECUTABLE
  )