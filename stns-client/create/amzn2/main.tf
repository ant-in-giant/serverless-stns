provider aws {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
  profile    = var.profile
}


# https://www.terraform.io/docs/providers/aws/d/ami.html#attributes-reference
data aws_ami "default" {
  most_recent = true
  owners      = ["amazon"]

  # Describe filters
  # https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeImages.html
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource aws_iam_instance_profile "ec2_ssm_access_iam_instance_profile" {
  name = "Ec2SsmAccessIamInstanceProfile"
  role = "Ec2SsmAccessIamRole"    // require created
}


resource aws_instance "amzn2_ec2_instance" {
  ami                    = var.ami == "" ? data.aws_ami.default.id : var.ami
  instance_type          = var.instance_type
  iam_instance_profile   = aws_iam_instance_profile.ec2_ssm_access_iam_instance_profile.name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "optional"  # "required"  # @see: https://tfsec.dev/docs/aws/AWS079/
  }

  tags = {
    Name = "ec2-stns-client-amzn2"
  }
}
