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

# Doxygen
FIND_PACKAGE(Doxygen QUIET)

IF (${DOXYGEN_FOUND})

  MESSAGE("-- Configuring Doxygen documentation")

  CONFIGURE_FILE(
    ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in
    ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
    )
    
  # define doxygen build type
  ADD_CUSTOM_TARGET(doxygen
    COMMAND ${DOXYGEN_EXECUTABLE} Doxyfile > doxygen.out
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Generating Doxygen documentation"
    )

ENDIF ()
