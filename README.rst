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
