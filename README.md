# Ansible Collection - delinea.pas

Ansible collection for Delinea Priviledged Access Services.

## Description

This is the README file for using Ansible roles in your playbooks to deploy Centrify software and enroll systems to Delinea Platform and/or Active Directory.
There is three Ansible roles provided, allowing deployment of Delinea Server Suite agents and Delinea Cloud Suite clients.
- delinea_audit
- delinea_auth
- delinea_vault


## Requirements

Installing collections with ansible-galaxy is only supported in ansible-core>=2.13.9


## Installation

Before using this collection, you need to install it with the Ansible Galaxy command-line tool:

```
ansible-galaxy collection install delinea.pas
```

You can also include it in a requirements.yml file and install it with ansible-galaxy collection install -r requirements.yml, using the format:


```yaml
collections:
  - name: delinea.pas
```

Note that if you install any collections from Ansible Galaxy, they will not be upgraded automatically when you upgrade the Ansible package.
To upgrade the collection to the latest available version, run the following command:

```
ansible-galaxy collection install delinea.pas --upgrade
```

You can also install a specific version of the collection, for example, if you need to downgrade when something is broken in the latest version (please report an issue in this repository). Use the following syntax to install version 1.0.1:

```
ansible-galaxy collection install delinea.pas:==1.0.1
```

See [using Ansible collections](https://docs.ansible.com/ansible/devel/user_guide/collections_using.html) for more details.


## Use Cases

### Delinea Audit and Monitoring Services Role
Role is named *delinea_audit* under *roles* folder.  
To start using this Role you should check the default variables under *roles/delinea_audit/defaults/main.yml* and declare values for your inventory using host_vars or group_vars

### Delinea Authentication and Privilege Elevation Services Role
Role is named *delinea_auth* under *roles* folder.  
To start using this Role you should check the default variables under *roles/delinea_auth/defaults/main.yml* and declare values for your inventory using host_vars or group_vars
You will also need to generate or edit the following files under *roles/delinea_auth/files*
- adjoin.keytab
- Centrify Agent for Windows64.msi
- Group Policy Deployment.mst
- Join-DelineaZone.ps1
- krb5.conf

**adjoin.keytab:**  
You can generate a keytab file to use with Active Directory service account using the followin commands on Linux (requires a Delinea joined Linux server).

**Delinea Agent for Windows64.msi and Group Policy Deployment.mst:**  
Both those files should be copied from the software source of the Delinea Infrastructure Services for Windows in use. Those two files are located under */Agent* folder.

**Join-DelineaZone.ps1:**  
This PowerShell script is provided as as sample and is used to join Windows system to existing Delinea Zone. This script can be modified to satisfy any customisation of the join process in your environment.
 
**krb5.conf:**  
You can copy the Kerberos config file of any of your Delinea joined Linux systems to the same Active Directory domain you plan to join using Ansible. Alternatively you can manually create this file using Kerberos docuementation.

### Delinea Vault Role
Role is named *delinea_vault* under *roles* folder.  
To start using this Role you should check the default variables under *roles/delinea_vault/defaults/main.yml* and declare values for your inventory using host_vars or group_vars

### Example
This is an example of hosts file declaring default inventory. 

**hosts**
```
---
# Grouped by OS
linux:
  hosts:
    rhel-nsblapp01.domain.name:
    rhel-nsblweb01.domain.name:
    suse-pgrsdb01.domain.name:
    ubnt-pgadmweb01.domain.name:

windows:
  hosts:
    win-centapp01.domain.name:
    win-centapp02.domain.name:
    win-rdpgw01.domain.name:

# Grouped by type
application:
  hosts:
    rhel-nsblapp01.domain.name:
    win-centapp01.domain.name:
    win-centapp02.domain.name:

database:
  hosts:
    suse-pgrsdb01.domain.name:

webserver:
  hosts:
    rhel-nsblweb01.domain.name:
    ubnt-pgadmweb01.domain.name:
    win-rdpgw01.domain.name:
```

Then an example of how to set values for Delinea roles on the Linux group of systems, using a file named linux under group_vars

**linux**
```
# Connection variable for linux
ansible_user: ansible 
ansible_become: yes

# Delinea variables for linux
delinea_redhat_urltoken: tc-xxxxxxxx-M0EV
delinea_debian_urltoken: dp-xxxxxxxx-WLgR
delinea_suse_urltoken: ga-xxxxxxxx-caHL

# Delinea Vault variables for linux
delinea_vault_tenant_url: https://company.my.centrify.net
delinea_vault_registration_code: I3-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-AWQJ5O1
delinea_vault_features: aapm,dmc 

# Delinea Auth variables for linux
delinea_auth_domain: domain.name
delinea_auth_service_principal: svc_adjoin@DOMAIN.NAME
delinea_auth_container: domain.name/Delinea/Computers
delinea_auth_zone: domain.name/Delinea/Zones/AWS/Linux

# Delinea Audit variables for linux
delinea_audit_installation_name: DelineaAMS
```


## Testing

For general testing guidelines, please refer to [Ansible Testing Documentation](https://docs.ansible.com/ansible/latest/dev_guide/testing.html).



## Contributing (Optional)


# Support

For support, please contact us at https://support.delinea.com/s/.


## Release Notes and Roadmap

Release notes and Roadmap for this Ansible collection are currently being developed. Please check back later for updates.We welcome community input on our roadmap. If you have suggestions or ideas for future development, please submit a pull request or open an issue on our GitHub repository.


## Related Information

Documentation - https://docs.delinea.com/online-help/cloud-suite/integrations/ansible/roles-for-ansible.htm


## License Information

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details. 