provider aws {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
  profile    = var.profile
}


resource aws_instance "focal_ec2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  iam_instance_profile   = "Ec2SsmAccessIamInstanceProfile"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "required"  # @see: https://tfsec.dev/docs/aws/AWS079/
  }

  tags = {
    Name = "ec2-stns-client-focal"
  }
}
