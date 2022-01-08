.. ---------------------------------------------------------------------
..
.. PartExa - A Particle Library for the Exa-Scale
..
.. Copyright (C) 2022 by the PartExa authors
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

.. toctree::
   :hidden:

.. _dependencies:

Dependencies
------------

The following provides an overview of all dependencies, such as system requirements or third
party libraries, including installation instructions needed for configuration and installation of
PartExa.

System requirements
~~~~~~~~~~~~~~~~~~~

It is assumed that a standard development environment with recent C++ compiler, MPI, and CMake is
present. More explicit system requirements are stated in the following:

* CMake_ version 3.12.0 or later

.. _CMake: https://cmake.org

deal.II with p4est
~~~~~~~~~~~~~~~~~~

PartExa strongly depends on the finite element library deal.II_ along with p4est_ for parallel
distributed adaptive quadtrees and octrees. For installation of deal.II with p4est follow the steps
below, which are based on the instructions given here:

* https://dealii.org/developer/readme.html
* https://dealii.org/developer/external-libs/p4est.html

.. _deal.II: https://www.dealii.org
.. _p4est: https://www.p4est.org

Clone the deal.II source code repository:

.. code-block:: console

   git clone https://github.com/dealii/dealii.git <dealii_source>

Download the (latest) p4est release tarball

.. code-block:: console

   mkdir <p4est_source>
   cd <p4est_source>
   wget https://p4est.github.io/release/p4est-x.y.z.tar.gz

where p4est-x.y.z.tar.gz is the name of the file and x.y.z the version. All stable releases of p4est
can be found `here <https://github.com/p4est/p4est.github.io/tree/master/release/>`_.

Install p4est making use of a configuration scipt provided by deal.II:

.. code-block:: console

   mkdir <p4est_install>
   cd <p4est_source>
   <dealii_source>/doc/external-libs/p4est-setup.sh p4est-x.y.z.tar.gz <p4est_install>

Configure and install deal.II with p4est:

.. code-block:: console

   mkdir <dealii_build> <dealii_install>
   cd <dealii_build>
   cmake -DCMAKE_INSTALL_PREFIX=<dealii_install> -DP4EST_DIR=<p4est_install> -DDEAL_II_WITH_P4EST=ON -DDEAL_II_WITH_MPI=ON <dealii_source>
   make -j <num_procs> install
