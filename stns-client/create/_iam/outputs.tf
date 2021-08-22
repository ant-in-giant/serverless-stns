
output "out_ec2_ssm_access_iam_role_arn" {
  value = aws_iam_role.ec2_ssm_access_iam_role.arn
}

output "out_ec2_ssm_access_iam_role_policy_attachment_arns" {
  value = [
    aws_iam_role_policy_attachment.ec2_ssm_access_iam_policy_attachment.policy_arn,
  ]
}
