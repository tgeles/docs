# Running DevStack on the Rackspace public cloud

This document documents how to run
[DevStack](http://docs.openstack.org/developer/devstack/)
on the [Rackspace public cloud](https://mycloud.rackspace.com/).

Some alternative options are:
- [rcbops single node devstack instructions]( https://ssl.rcbops.com/mediawiki/index.php/Single_node_devstack)
- [openstack-ansible all-in-one]( http://docs.openstack.org/developer/openstack-ansible/developer-docs/quickstart-aio.html)

## CentOS DevStack on RAX

1. Create a CentOS 7 server using the 4GB General Purpose v1 flavor with an
   appropriate ssh key, and the standard public and service networks.

1. Access the machine using **ssh** as root:
   ```
   ssh root@123.456.789
   ```

1. Update the machine, then clone the devstack repository:
   ```
   # yum update -y
   # git clone https://git.openstack.org/openstack-dev/devstack
   ```

1. Create the stack user by running the **create-stack-user.sh** script:
   ```
   # ./devstack/tools/create-stack-user.sh
   ```

1. Switch to the stack user and clone the devstack repository again:
   ```
   # su - stack
   $ git clone https://git.openstack.org/openstack-dev/devstack
   ```

1. Install DevStack by running the **stack.sh** script:
   ```
   $ ./devstack/stack.sh
   ```

1. Specify passwords when required by the installation script.

1. After the installation finishes, logout as the **stack** user:
   ```
   $ exit
   ```

1. As root, create an **admin-openrc.sh** file in **/root** with the following contents. Sourcing this file sets certain environment variables to save typing when running openstack commands. Substitute the password and IP address of your devstack:
   ```
   export OS_PROJECT_DOMAIN_ID=default
   export OS_USER_DOMAIN_ID=default
   export OS_PROJECT_NAME=admin
   export OS_TENANT_NAME=admin
   export OS_USERNAME=admin
   export OS_PASSWORD=PASSWORD
   export OS_AUTH_URL=http://123.456.789:5000/v3
   export OS_IDENTITY_API_VERSION=3
   ```

1. Source the **admin-openrc.sh** file:
   ```
   # source admin-openrc.sh
   ```

1. Generate and add a key pair:
   ```
   # ssh-keygen -q -N ""
   # nova keypair-add --pub-key .ssh/id_rsa.pub mykey
   ```

1. Verify addition of the key pair:
   ```
   nova keypair-list
   +-------+-------------------------------------------------+
   | Name  | Fingerprint                                     |
   +-------+-------------------------------------------------+
   | mykey | 6c:74:ec:3a:08:05:4e:9e:21:22:a6:dd:b2:62:b8:28 |
   +-------+-------------------------------------------------+
   ```

1. Add ping and SSH security rules:
   ```
   # nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
+-------------+-----------+---------+-----------+--------------+
| IP Protocol | From Port | To Port | IP Range  | Source Group |
+-------------+-----------+---------+-----------+--------------+
| icmp        | -1        | -1      | 0.0.0.0/0 |              |
+-------------+-----------+---------+-----------+--------------+

  # nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
+-------------+-----------+---------+-----------+--------------+
| IP Protocol | From Port | To Port | IP Range  | Source Group |
+-------------+-----------+---------+-----------+--------------+
| tcp         | 22        | 22      | 0.0.0.0/0 |              |
+-------------+-----------+---------+-----------+--------------+
   ```

1. Add a cirros image to the Glance repository:
   ```
   # wget http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img
   # glance image-create --name "cirros" --file cirros-0.3.4-x86_64-disk.img --disk-format qcow2 --container-format bare --visibility public --progress
   ```

1. List available images:
   ```
   # nova image-list
+--------------------------------------+--------+--------+--------+
| ID                                   | Name   | Status | Server |
+--------------------------------------+--------+--------+--------+
| 38047887-61a7-41ea-9b49-27987d5e8bb9 | cirros | ACTIVE |        |
+--------------------------------------+--------+--------+--------+
   ```

1. List available flavors:
   ```
   # nova flavor-list
+-----+-----------+-----------+------+-----------+------+-------+-------------+-----------+
| ID  | Name      | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public |
+-----+-----------+-----------+------+-----------+------+-------+-------------+-----------+
| 1   | m1.tiny   | 512       | 1    | 0         |      | 1     | 1.0         | True      |
| 2   | m1.small  | 2048      | 20   | 0         |      | 1     | 1.0         | True      |
| 3   | m1.medium | 4096      | 40   | 0         |      | 2     | 1.0         | True      |
| 4   | m1.large  | 8192      | 80   | 0         |      | 4     | 1.0         | True      |
| 5   | m1.xlarge | 16384     | 160  | 0         |      | 8     | 1.0         | True      |
+-----+-----------+-----------+------+-----------+------+-------+-------------+-----------+
   ```

1. List available security groups:
   ```
   # nova secgroup-list
+--------------------------------------+---------+-------------+
| Id                                   | Name    | Description |
+--------------------------------------+---------+-------------+
| ad8d4ea5-3cad-4f7d-b164-ada67ec59473 | default | default     |
+--------------------------------------+---------+-------------+
   ```

1. Launch an instance:
   ```
   # nova boot --flavor m1.tiny --image cirros --security-group default --key-name mykey myinstance
+--------------------------------------+-----------------------------------------------+
| Property                             | Value                                         |
+--------------------------------------+-----------------------------------------------+
| OS-DCF:diskConfig                    | MANUAL                                        |
| OS-EXT-AZ:availability_zone          |                                               |
| OS-EXT-SRV-ATTR:host                 | -                                             |
| OS-EXT-SRV-ATTR:hostname             | myinstance                                    |
| OS-EXT-SRV-ATTR:hypervisor_hostname  | -                                             |
| OS-EXT-SRV-ATTR:instance_name        | instance-00000002                             |
| OS-EXT-SRV-ATTR:kernel_id            |                                               |
| OS-EXT-SRV-ATTR:launch_index         | 0                                             |
| OS-EXT-SRV-ATTR:ramdisk_id           |                                               |
| OS-EXT-SRV-ATTR:reservation_id       | r-su40i1k4                                    |
| OS-EXT-SRV-ATTR:root_device_name     | -                                             |
| OS-EXT-SRV-ATTR:user_data            | -                                             |
| OS-EXT-STS:power_state               | 0                                             |
| OS-EXT-STS:task_state                | scheduling                                    |
| OS-EXT-STS:vm_state                  | building                                      |
| OS-SRV-USG:launched_at               | -                                             |
| OS-SRV-USG:terminated_at             | -                                             |
| accessIPv4                           |                                               |
| accessIPv6                           |                                               |
| adminPass                            | u8uZM35FJoTE                                  |
| config_drive                         |                                               |
| created                              | 2015-10-26T05:50:14Z                          |
| flavor                               | m1.tiny (1)                                   |
| hostId                               |                                               |
| id                                   | 279efcf9-f168-4b1d-a1d2-4424de7c9b25          |
| image                                | cirros (bed0c617-77f8-4e90-8310-f65436c51a84) |
| key_name                             | mykey                                         |
| metadata                             | {}                                            |
| name                                 | myinstance                                    |
| os-extended-volumes:volumes_attached | []                                            |
| progress                             | 0                                             |
| security_groups                      | default                                       |
| status                               | BUILD                                         |
| tenant_id                            | d8859cbbd5924a159b569f7f57c3ab8c              |
| updated                              | 2015-10-26T05:50:15Z                          |
| user_id                              | 214c9d984a084cd6b92e89bafc755c9c              |
+--------------------------------------+-----------------------------------------------+
   ```