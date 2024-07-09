# Ansible Collection - delinea.pas
This is the README file for using Ansible roles in your playbooks to deploy Centrify software and enroll systems to Delinea Platform and/or Active Directory.
There is three Ansible roles provided, allowing deployment of Delinea Server Suite agents and Delinea Cloud Suite clients.
- delinea_audit
- delinea_auth
- delinea_vault

## Installation
To make these roles available in your playbooks, you must install them on your Ansible server by running the following command:
```
ansible-galaxy install git@github.com:centrify/ansible#roles
``` 

Alternatively, you can copy the content of *roles* folder of this repository under *.ansible/roles* located in the home directory of the user running playbooks or under */etc/ansible/roles*.

## Configuration

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