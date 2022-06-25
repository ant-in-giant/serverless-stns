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
    values = ["amzn2-ami-hvm-2.0.????????-arm64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


resource aws_instance "amzn2_arm64_ec2_instance" {
  ami                    = var.ami == "" ? data.aws_ami.default.id : var.ami
  instance_type          = var.instance_type
  iam_instance_profile   = "Ec2SsmAccessIamInstanceProfile"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  #key_name = aws_key_pair.sogaoh_key.key_name 

  root_block_device {
    volume_type = "gp3"
    volume_size = 12
    tags = {
      Name = "ec2-amzn2-arm64-gp3-24G"
    }
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "required"  # @see: https://aquasecurity.github.io/tfsec/latest/checks/aws/ec2/enforce-http-token-imds/
  }

  tags = {
    Name = "ec2-amzn2-arm64"
  }
}

# resource aws_key_pair "sogaoh_key" {
#   key_name   = "sogaoh-key"
#   public_key = var.public_key
# }
