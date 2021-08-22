provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
  profile    = var.profile
}

resource aws_iam_role "ec2_ssm_access_iam_role" {
  name = "Ec2SsmAccessIamRole"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_iam_policy.json

  tags = {
    Name = "Ec2SsmAccessIamRole"
  }
}

data aws_iam_policy_document "ec2_assume_role_iam_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource aws_iam_role_policy_attachment "ec2_ssm_access_iam_policy_attachment" {
  role = aws_iam_role.ec2_ssm_access_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
