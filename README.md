# terraform_tutorial

### Create key_pair
```bash
$ aws ec2 create-key-pair --key-name key_pair --query 'KeyMaterial' --output text > ~/.ssh/key_pair.pem
$ chmod 400 ~/.ssh/key_pair.pem
```