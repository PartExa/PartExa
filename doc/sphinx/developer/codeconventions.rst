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

.. _codeconventions:

Code Conventions
----------------

This page provides the general code conventions that are followed in PartExa.

License headers
~~~~~~~~~~~~~~~

The license header of the files in the repository shall be compliant with a standard license
header that looks, e.g., for `CMake` files, as:

.. literalinclude:: ../../../CMakeLists.txt
   :lines: 1-20

.. note::

   The year(s) within the copyright statement is set to the year a file is added to the repo (e.g.,
   2021), or to the time span a file is created and modified last (e.g. 2021-2025).

For convenience, scripts are provided that check the license header of all files respectively of
files changed with respect to the latest master.

To check the license headers of all files execute:

.. code-block:: console

   cd <partexa_source>
   ./utilities/license-header/check-all-files.sh

To check the license headers of all files changed with respect to the latest master version execute:

.. code-block:: console

   cd <partexa_source>
   ./utilities/license-header/check-changed-files.sh
