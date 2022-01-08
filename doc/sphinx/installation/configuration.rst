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

.. _configuration:

Configuration and installation
------------------------------

For configuration and installation of PartExa and the associated Sphinx and Doxygen documentation
first clone the PartExa source code repository:

.. code-block:: console

   git clone git@github.com:PartExa/PartExa.git <partexa_source>

PartExa library
~~~~~~~~~~~~~~~

In the following it is assumed that all :ref:`dependencies` are met. Configure and build PartExa
following

.. code-block:: console

   mkdir <partexa_build>
   cd <partexa_build>
   cmake <partexa_source> -DCMAKE_BUILD_TYPE=<build_type> -DDEAL_II_DIR=<dealii_install>
   make -j <np>

where `<build_type>` denotes the build type and can be set to `Release` or `Debug`, and `<np>`
denotes a specific number of processors used for compilation.

.. note::

   The build type of PartExa can be changed at any time by executing:

   .. code-block:: console

      cd <partexa_build>
      make <build_type>

Sphinx documentation
~~~~~~~~~~~~~~~~~~~~

To manually build the Sphinx documentation a virtual python environment is set up as:

.. code-block:: console

   cd <partexa_build>
   python3 -m venv venv
   source venv/bin/activate
   pip install sphinx sphinx_rtd_theme

In a next step reconfigure PartExa and build the Sphinx documentation:

.. code-block:: console

   cd <partexa_build>
   cmake <partexa_source> -DDEAL_II_DIR=<dealii_install>
   make sphinx

.. note::

   For convenience, a recent precompiled `Sphinx <https://partexa.github.io/PartExa-Sphinx/>`_ documentation is provided online.

Doxygen documentation
~~~~~~~~~~~~~~~~~~~~~

To manually build the Doxygen documentation install the packages `doxygen` and `graphviz`.

In a next step reconfigure PartExa and build the Doxygen documentation:

.. code-block:: console

   cd <partexa_build>
   cmake <partexa_source> -DDEAL_II_DIR=<dealii_install>
   make doxygen

.. note::

   For convenience, a recent precompiled `Doxygen <https://partexa.github.io/PartExa-Doxygen/>`_ documentation is provided online.
