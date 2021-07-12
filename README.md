# Homelab setup

Creating this to automate the setup of my infra in my homelab.
So far this doesn't include restoring data.

* Secures the installation (changes user and root passwords, adds keys, disables root ssh login and sudo roles).
* Setup kubernetes cluster
* Setup gitlab
* Nginx reverse proxy and certbox
* Database setup (postgres)
* DNS setup (This is still work in progress and may not be used.)

## Vault Variables
* public_key
* root_password
* primary_username_pw