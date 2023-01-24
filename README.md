# Terraform 3-Tier Architecture
## 📜 Overview

### Resource
* VPC - Virtual Private Cloud
* Subnet
* IGW - Internet Gateway
* NAT Gateway
* Route Table
* NACL - Network ACL
* SG - Security Group
* EC2 - Elastic Compute Cloud
* ALB - Application Load Balancer
* RDS - Relational Database Service

## 🎯 Usage
### Create key_pair
```bash
$ aws ec2 create-key-pair --key-name key_pair --query 'KeyMaterial' --output text > ~/.ssh/key_pair.pem
$ chmod 400 ~/.ssh/key_pair.pem
```

### Apply
```bash
$ terraform init
$ terraform plan
$ terraform apply
var.access_ip
  Enter a value: {your_ip}

var.database_password
  Enter a value: {your_database_password}

...

Apply complete! Resources: 47 added, 0 changed, 0 destroyed.
```

### Complete
```bash
$ curl ${alb-endpoint}
Terraform Tutorial ip-xx-x-xx-xxx.ap-northeast-2.compute.internal
```

```bash
$ ssh -i ~/.ssh/key_pair.pem ec2-user@{bastion-ip}
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
7 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
-bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory

[ec2-user@{bastion-ip} ~]$ mysql -h ${rds-endpoint} -u yaini -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.28 Source distribution

MySQL [(none)]>
```