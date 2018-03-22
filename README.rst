====
sssd
====

Install and configure sssd (along with nsswitch)

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:


``sssd``
---------------

Install packages, configure it and nsswitch.conf

``sssd.packages``
---------------

Install sssd packages.

``sssd.config``
---------------

Configure sssd, also ensuring the service runs.

``sssd.nsswitch``
---------------

Configure nsswitch.conf use to the desired databases (and only those).
