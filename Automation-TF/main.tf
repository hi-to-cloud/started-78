data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "ec2-made-easy" {
  source                      = "terraform-aws-modules/ec2-instance/aws"

  # count                       = 3
  ami                         = data.aws_ami.ami_id.id
  instance_type               = "t3.micro"
  monitoring                  = true
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-0d252c8914c14d476"]
  subnet_id                   = "subnet-05b07817613371e42"
  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 30
    }
  ]
}

output "Public_instance_ips" {
  value = module.ec2-made-easy[*].public_ip
}

output "private_instance_ips" {
  value = module.ec2-made-easy[*].private_ip
}