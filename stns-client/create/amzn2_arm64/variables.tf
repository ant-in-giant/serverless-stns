variable profile {}

variable region {}

variable aws_access_key {}
variable aws_secret_key {}

variable ami {
  type = string
  default = "ami-07b3b0525cef50a4a"     # amzn2-ami-hvm-2.0.20220606.1-arm64-gp2
}
variable instance_type {}
variable subnet_id {}
variable vpc_security_group_ids {}

#variable public_key {}
