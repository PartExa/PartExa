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

#include <deal.II/base/conditional_ostream.h>

namespace PartExa
{
  inline void
  print_partexa_header(dealii::ConditionalOStream const &pcout)
  {
    // clang-format off
    pcout << std::endl
    << "________________________________________________________________________________" << std::endl
    << "                       ____           _   _____                                 " << std::endl
    << "                      |  _ \\__ _ _ __| |_| ____|_  _ __ _                      " << std::endl
    << "                      | |_)| _` | '__| __|  _| \\ \\/ / _` |                    " << std::endl
    << "                      |  __/(_| | |  | |_| |___ >  < (_| |                      " << std::endl
    << "                      |_|  \\__,_|_|  \\___|_____/_/\\_\\__,_|                  " << std::endl
    << "                                                                                " << std::endl
    << "                      A Particle Library for the Exa-Scale                      " << std::endl
    << "________________________________________________________________________________" << std::endl
    << std::endl;
    // clang-format on
  }

} // namespace PartExa

#endif
