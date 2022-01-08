## ---------------------------------------------------------------------
##
## PartExa - A Particle Library for the Exa-Scale
##
## Copyright (C) 2021-2022 by the PartExa authors
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

FIND_PACKAGE(Sphinx QUIET)

IF (${SPHINX_FOUND})

  MESSAGE("-- Configuring Sphinx documentation")

  SET(SPHINX_SOURCE ${CMAKE_CURRENT_SOURCE_DIR})
  SET(SPHINX_BUILD ${CMAKE_CURRENT_BINARY_DIR}/html)
  SET(PARTEXA_LOGO ${CMAKE_SOURCE_DIR}/doc/logo/logo_white_rounded_small.png)

  ADD_CUSTOM_TARGET(sphinx
    COMMAND ${SPHINX_EXECUTABLE} -b html -w sphinx.err -Dhtml_logo=${PARTEXA_LOGO} -Dhtml_favicon=${PARTEXA_LOGO} ${SPHINX_SOURCE} ${SPHINX_BUILD} > sphinx.out
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Generating Sphinx documentation"
    )

ENDIF ()
