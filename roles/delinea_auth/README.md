# Delinea Authentication Role

## Description

This role installs, enrolls, unenrolls, and removes Delinea Authentication and Privilege Elevation Services on your systems. It supports RHEL/CentOS, Debian, and SUSE distributions.

## Requirements

- Ansible 2.15 or higher
- Supported OS:
  - RHEL/CentOS
  - Debian
  - SUSE

## Role Variables

The following variables can be customized:

### Common Variables

| Variable                    | Default Value | Description                                                                                     |
|-----------------------------|---------------|-------------------------------------------------------------------------------------------------|
| `delinea_auth_task`         | `install`     | Task to execute when running the playbook. Possible values: `install`, `enroll`, `unenroll`, `remove`. |
| `delinea_redhat_urltoken`   |               | URL Token for Delinea repo for Red Hat. No default value, must be set. Refer to [Delinea Download Center](https://support.delinea.com/s/repository) for more details. |
| `delinea_debian_urltoken`   |               | URL Token for Delinea repo for Debian. No default value, must be set. Refer to [Delinea Download Center](https://support.delinea.com/s/repository) for more details. |
| `delinea_suse_urltoken`     |               | URL Token for Delinea repo for SUSE. No default value, must be set. Refer to [Delinea Download Center](https://support.delinea.com/s/repository) for more details. |

### Delinea Authentication and Privilege Elevation Services Variables

| Variable                            | Default Value            | Description                                                              |
|-------------------------------------|--------------------------|--------------------------------------------------------------------------|
| `delinea_auth_domain`               |                          | Active Directory domain name to use during join operations. Example: `aasgaard.lab`. |
| `delinea_auth_service_principal`    |                          | Active Directory Service Account to use during join operations. Example: `svc_delineaadjoin@AASGAARD.LAB`. |
| `delinea_auth_service_keytab`       | `/etc/adjoin.keytab`     | Location of the Kerberos Keytab file to use during join operations.      |
| `delinea_auth_realm_config`         | `/etc/krb5.conf`         | Location of the Kerberos Realm configuration file to use during join operations. |
| `delinea_auth_container`            |                          | Active Directory container to use for Computers object during join operations. Example: `aasgaard.lab/Delinea/Computers`. |
| `delinea_auth_zone`                 |                          | Delinea Zone to use during join operations. Example: `aasgaard.lab/Delinea/Zones/Global/Linux`. |

### Sudo Password for Operations

- If not using the root user, you must provide a password for sudo access for some command executions.
- It is recommended to use `--ask-become-pass` while running the playbook to avoid hardcoding passwords.

## Example Playbook

Here is an example of how to use this role in a playbook:

```yaml
- name: Manage Delinea Authentication Services
  hosts: all
  roles:
    - role: my_namespace.delinea_auth
      vars:
        delinea_auth_task: install
        delinea_redhat_urltoken: "your_redhat_url_token"
