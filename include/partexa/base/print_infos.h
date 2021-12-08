// ---------------------------------------------------------------------
//
// PartExa - A Particle Library for the Exa-Scale
//
// Copyright (C) 2021 by the PartExa authors
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
//
// ---------------------------------------------------------------------

#ifndef partexa_base_print_infos_h
#define partexa_base_print_infos_h

#include <partexa/base/revision.h>

#include <deal.II/base/conditional_ostream.h>
#include <deal.II/base/revision.h>

namespace PartExa
{
  //! print PartExa header
  inline void
  print_partexa_header(dealii::ConditionalOStream const &pcout)
  {
    // clang-format off
    pcout << std::endl;
    pcout << "________________________________________________________________________________" << std::endl;
    pcout << "                       ____           _   _____                                 " << std::endl;
    pcout << "                      |  _ \\__ _ _ __| |_| ____|_  _ __ _                      " << std::endl;
    pcout << "                      | |_)| _` | '__| __|  _| \\ \\/ / _` |                    " << std::endl;
    pcout << "                      |  __/(_| | |  | |_| |___ >  < (_| |                      " << std::endl;
    pcout << "                      |_|  \\__,_|_|  \\___|_____/_/\\_\\__,_|                  " << std::endl;
    pcout << "                                                                                " << std::endl;
    pcout << "                      A Particle Library for the Exa-Scale                      " << std::endl;
    pcout << "________________________________________________________________________________" << std::endl;
    pcout << std::endl;
    // clang-format on
  }

  //! print PartExa version
  inline void
  print_partexa_version(dealii::ConditionalOStream const &pcout)
  {
    // clang-format off
    pcout << std::endl;
    pcout << "PartExa branch: " PARTEXA_GIT_BRANCH << std::endl;
    pcout << "PartExa hash:   " PARTEXA_GIT_REVISION << std::endl;
    pcout << std::endl;
    // clang-format on
  }

  //! print deal.II version
  inline void
  print_dealii_version(dealii::ConditionalOStream const &pcout)
  {
    // clang-format off
    pcout << std::endl;
    pcout << "deal.II branch: " DEAL_II_GIT_BRANCH << std::endl;
    pcout << "deal.II hash:   " DEAL_II_GIT_REVISION << std::endl;
    pcout << std::endl;
    // clang-format on
  }

} // namespace PartExa

#endif
