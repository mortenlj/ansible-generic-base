Ansible Generic Base
====================

This is an attempt to create a minimal common ground for a generic linux installation according to my preferences.

It's limited to Ubuntu based distros.

It requires a variable named ``default_user`` which will be used as owner of some files.

The setup installs dma to handle local email, and if ``forwarding_address`` is set it will be used as a catch all alias.
If ``masquerading_address`` is set, it will be used as the masquerading address for outgoing mail.
