provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
  profile    = var.profile
}

module "stns" {
  source  = "../../module/aws-serverless-stns-api"

  api_policy_json = <<EOF
  {
     "Version": "2012-10-17",
     "Statement": [
         {
             "Effect": "Allow",
             "Principal": "*",
             "Action": "execute-api:Invoke",
             "Resource": "execute-api:/*/*/*"
         }
     ]
  }
EOF
  api_name = "stns-api"
  stage_name = "v2"
  user_table_name = "stns-users"
  group_table_name = "stns-groups"
  auth_table_name = "stns-authorizations"
  log_retention_in_days = 30
  base_tags = {
    "CreatedBy" = "terraform"
  }
  endpoint_type = "EDGE"
}
