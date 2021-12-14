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

CMAKE_MINIMUM_REQUIRED(VERSION 3.12.0)

ADD_SUBDIRECTORY(cmake)

PRINT_PARTEXA_HEADER()

# deal.II
FIND_PACKAGE(
  deal.II 10.0.0 QUIET
  HINTS ${deal.II_DIR} ${DEAL_II_DIR} $ENV{DEAL_II_DIR}
  )
IF(NOT ${deal.II_FOUND})
  MESSAGE(
    FATAL_ERROR
    "\n"
    "*** Could not locate a (sufficiently recent) version of deal.II. ***\n\n"
    "You may want to either pass a flag -DDEAL_II_DIR=/path/to/deal.II to cmake\n"
    "or set an environment variable \"DEAL_II_DIR\" that contains this path."
    )
ENDIF()

# p4est
IF(NOT DEAL_II_WITH_P4EST)
  MESSAGE(
    FATAL_ERROR
    "\n"
    "*** deal.II was configured without DEAL_II_WITH_P4EST enabled. ***\n\n"
    "You may want to provide another deal.II installation with flag -DDEAL_II_WITH_P4EST=ON."
    )
ENDIF()

DEAL_II_INITIALIZE_CACHED_VARIABLES()

DEAL_II_QUERY_GIT_INFORMATION(PARTEXA)
MESSAGE("--")
MESSAGE("-- PartExa branch: " ${PARTEXA_GIT_BRANCH})
MESSAGE("-- PartExa hash:   " ${PARTEXA_GIT_REVISION})
MESSAGE("--")
MESSAGE("-- deal.II branch: " ${DEAL_II_GIT_BRANCH})
MESSAGE("-- deal.II hash:   " ${DEAL_II_GIT_REVISION})
MESSAGE("--")

CONFIGURE_FILE(
  ${CMAKE_SOURCE_DIR}/include/partexa/base/revision.h.in
  ${CMAKE_BINARY_DIR}/include/partexa/base/revision.h
  )

PROJECT(partexa)

INCLUDE_DIRECTORIES(include ${CMAKE_BINARY_DIR}/include)

ADD_LIBRARY(partexa
  source/dummy.cc
  )
DEAL_II_SETUP_TARGET(partexa)

# define release and debug build types
ADD_CUSTOM_TARGET(debug
  COMMAND ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Debug ${CMAKE_SOURCE_DIR}
  COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target all
  COMMENT "Switch CMAKE_BUILD_TYPE to Debug"
  )

ADD_CUSTOM_TARGET(release
  COMMAND ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Release ${CMAKE_SOURCE_DIR}
  COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target all
  COMMENT "Switch CMAKE_BUILD_TYPE to Release"
  )

# enable documentation
ADD_SUBDIRECTORY(doc/doxygen)

# enable testing framework
ENABLE_TESTING()
ADD_SUBDIRECTORY(tests)
