Ansible Generic Base
====================

This is an attempt to create a minimal common ground for a generic installation according to my preferences.

The role supports macOS in addition to Debian/Ubuntu (bash only).
Homebrew must be pre-installed.
PATH for Homebrew is the user's dotfiles' responsibility, not this role's.

It requires a variable named ``default_user`` which will be used as owner of some files.

The setup installs dma to handle local email, and if ``forwarding_address`` is set it will be used as a catch all alias.
If ``masquerading_address`` is set, it will be used as the masquerading address for outgoing mail.

``default_user``, ``forwarding_address``, ``masquerading_address`` are Linux-only.
On macOS the timezone task uses ``systemsetup``, which requires Full Disk Access when run over SSH.

All installed packages are listed in the ``generic_base_packages`` variable, defined in ``defaults/main.yml``.
Setting it replaces the whole list, so an override must contain every package you want installed.
A plain string is installed under the same name by both apt and Homebrew.
A mapping uses the ``apt`` and ``homebrew`` keys when the names differ or the package exists on only one platform.
A platform key that is left out means nothing is installed on that platform.
A value that resolves to ``null`` also means nothing is installed, which allows conditions on facts, for example:

.. code-block:: yaml

   generic_base_packages:
     - bash
     - apt: bash-completion
       homebrew: bash-completion@2
     - apt: pinentry-curses
     - homebrew: "{{ 'eza' if ansible_facts['system'] == 'Darwin' else none }}"
