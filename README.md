# serverless-stns 

bases: https://github.com/sogaoh/aws-stns-serverless-api  
origin: https://github.com/QLife-Inc/aws-stns-serverless-api

stns: https://stns.jp/


## PreRequirements
macOS or Linux

### Create Server
- for api
  - Ruby 2.7
  - find コマンド (Lambda ソースを一覧するために利用)
  - md5sum コマンド (Lambda ソースの更新チェックに利用)
  - zip コマンド (Lambda ソースのアーカイブに利用)
- for infrastructure
  - Terraform 1.0
  - terraform-provider-aws (>=3.52.0)

