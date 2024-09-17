# Delinea Audit Role

## Description

This role installs, enrolls, unenrolls, and removes Delinea Audit and Monitoring Services on your systems. It supports RHEL/CentOS, Debian, and SUSE distributions.

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
| `delinea_audit_task`        | `install`     | Task to execute when running the playbook. Possible values: `install`, `enroll`, `unenroll`, `remove`. |
| `delinea_redhat_urltoken`   |               | URL Token for Delinea repo for Red Hat. No default value, must be set. Refer to [Delinea Download Center](https://support.delinea.com/s/repository) for more details. |
| `delinea_debian_urltoken`   |               | URL Token for Delinea repo for Debian. No default value, must be set. Refer to [Delinea Download Center](https://support.delinea.com/s/repository) for more details. |
| `delinea_suse_urltoken`     |               | URL Token for Delinea repo for SUSE. No default value, must be set. Refer to [Delinea Download Center](https://support.delinea.com/s/repository) for more details. |

### Delinea Audit and Monitoring Services Variables

| Variable                            | Default Value | Description                                                              |
|-------------------------------------|---------------|--------------------------------------------------------------------------|
| `delinea_audit_installation_name`   |               | Active Directory domain name to use during join operations. Example: `aasgaard.lab`. |

### Sudo Password for Operations

- If not using the root user, you must provide a password for sudo access for some command executions.
- It is recommended to use `--ask-become-pass` while running the playbook to avoid hardcoding passwords.

## Example Playbook

Here is an example of how to use this role in a playbook:

```yaml
- name: Manage Delinea Audit Services
  hosts: all
  roles:
    - role: my_namespace.delinea_audit
      vars:
        delinea_audit_task: install
        delinea_redhat_urltoken: "your_redhat_url_token"
        delinea_debian_urltoken: "your_debian_url_token"
        delinea_suse_urltoken: "your_suse_url_token"
        delinea_audit_installation_name: "your_domain_name"
