.. ---------------------------------------------------------------------
..
.. PartExa - A Particle Library for the Exa-Scale
..
.. Copyright (C) 2021-2022 by the PartExa authors
..
.. This program is free software: you can redistribute it and/or modify
.. it under the terms of the GNU General Public License as published by
.. the Free Software Foundation, either version 3 of the License, or
.. (at your option) any later version.
..
.. This program is distributed in the hope that it will be useful,
.. but WITHOUT ANY WARRANTY; without even the implied warranty of
.. MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
.. GNU General Public License for more details.
..
.. You should have received a copy of the GNU General Public License
.. along with this program. If not, see <https://www.gnu.org/licenses/>.
..
.. ---------------------------------------------------------------------

PartExa - A Particle Library for the Exa-Scale
==============================================

PartExa is an open-source particle library written in C++ using state-of-the-art programming
techniques. PartExa strongly depends on the finite element library 
`deal.II <https://www.dealii.org/>`_ along with `p4est <https://www.p4est.org/>`_ for parallel 
distributed adaptive quadtrees and octrees. deal.II provides basic particle functionality with a
strong focus on efficient data structures and aspects of parallelization.

The major features of PartExa include

* generic neighbor search algorithms for particle-particle, particle-cell, particle-face, and
  particle-vertex pairs,
* multiple phases and transition of particles between phases,
* cluster of particles that are connected by (rigid) bonds, and
* evaluation routines for a variety of particle methods such as the Discrete Element Method (DEM),
  Smoothed Particle Hydrodynamics (SPH), and Peridynamics (PD).

Making use of the sophisticated interfaces and data structures provided by deal.II facilitates the
coupling of PartExa with other deal.II-based programs.

.. toctree::
   :maxdepth: 2
   :caption: Installation guide

   installation/installation.rst
