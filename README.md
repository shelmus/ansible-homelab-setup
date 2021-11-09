# Homelab setup

Creating this to automate the setup of my infra in my homelab.
So far this doesn't include restoring data.

* Secures the installation (changes user and root passwords, adds keys, disables root ssh login and sudo roles).
* Setup kubernetes cluster
* Setup gitlab
* Nginx reverse proxy and certbox
* Database setup (postgres)
* DNS setup (This is still work in progress and may not be used.

## Vault Variables
* public_key
* root_password
* primary_username_pw

## Required Galaxy installs.

```
ansible-galaxy role install geerlingguy.security
ansible-galaxy role install geerlingguy.docker
ansible-galaxy role install geerlingguy.kubernetes
ansible-galaxy role install geerlingguy.gitlab
ansible-galaxy collection install freeipa.ansible_freeipa
```

## Create IPA configs

* Need to edit the inventory and the vault and move them to the folder in the home dir.

```
/home/sean/.ansible/collections/ansible_collections/freeipa/ansible_freeipa
```