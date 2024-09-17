# Development Guide

Table of contents:

- [Prerequisites](#prerequisites)
- [Get the code](#get-the-code)
- [Development](#development)
- [Release](#release)

Make sure to checkout [the official developer guide for developing collections][developing-collections].

## Prerequisites

- [Python][get-python] version 3.7 or higher

## Get the code

Ansible requires that collections are stored in `{...}/ansible_collections/NAMESPACE/COLLECTION_NAME` path.
Therefore to be able to run tests, clone this repository to `{arbitrary path}/ansible_collections/delinea/pas`.

Example with using home directory:

```shell
mkdir -p ~/ansible_collections/delinea/pas
```

```shell
git clone git@github.com:DelineaXPM/ansible-pas-collection.git ~/ansible_collections/delinea/pas
```

```shell
cd ~/ansible_collections/delinea/pas
```

## Development
Install Ansible:

```shell
sudo apt update
sudo apt install ansible
```

Build Ansible Collection:

```shell
ansible-galaxy collection build --force
```

Install Ansible Collection locally

```shell
ansible-galaxy collection install delinea-pas-1.0.4.tar.gz --force
```

Test Ansible collection

```shell
ansible-playbook site.yml
```

## Release

Follow [this link][delinea-pas-galaxy] to open the `delinea.pas` collection in [Ansible Galaxy][galaxy] hub.

1. Change the version number. Follow semantic versioning when setting the version for your collection:

    * Increment the major version number, x of x.y.z, for an incompatible API change.
    * Increment the minor version number, y of x.y.z, for new functionality in a backwards compatible manner (for example new modules/plugins, parameters, return values).
    * Increment the patch version number, z of x.y.z, for backwards compatible bug fixes.

2. Update installation instructions in [README.md][readme.md].

3. Write a release summary:

    Add [version_number].yml file under changelogs/fragment folder and write release summary in below format:

    ```shell
    release_summary: `<describe release summary>`
    ```

    Then generate changelog using below commands

   ```shell
   pip install antsibull-changelog
   antsibull-changelog init <path/to/your/collection>
   antsibull-changelog release [--version version_number]
   ```

4. Build the collection:

   ```shell
   ansible-galaxy collection build --force
   ```

   As a result a new archive will be generated (e.g. `delinea-pas-1.0.4.tar.gz`) in the collection directory (`~/ansible_collections/delinea/pas/`).

5. Publish the collection:

   ```shell
   ansible-galaxy collection publish ~/ansible_collections/delinea/pas//delinea-pas-1.0.4.tar.gz -api-key=SECRET
   ```

[developing-collections]: https://docs.ansible.com/ansible/latest/dev_guide/developing_collections.html
[get-python]: https://www.python.org/downloads/
[delinea-core-galaxy]: https://galaxy.ansible.com/delinea/pas
[galaxy]: https://galaxy.ansible.com/
[readme.md]: README.md
