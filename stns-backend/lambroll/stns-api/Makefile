.PHONY:

help:
	cat Makefile

OPT_LOG      := --log-level=info
OPT_PROFILE  := --profile="default"
OPT_REGION   := --region="ap-northeast-1"
OPT_FUNCTION := --function="function.json"
OPT_DEPLOY_FUNCTION := --function="function_deploy.json"
OPT_TFSTATE := --tfstate="../../create/terraform.tfstate"
OPT_SRC      := --src="."
OPT_EXCLUDE  := --exclude-file=".lambdaignore"


cpzip:
	@if [ -f function.zip ]; \
	then \
		rm -f function.zip; \
	fi;
	cp -p ../../../module/aws-serverless-stns-api/lambda/stns-api/app.zip ./function.zip


list:
	lambroll list $(OPT_PROFILE) $(OPT_REGION)

diff:
	@make cpzip
	lambroll diff $(OPT_LOG) $(OPT_PROFILE) $(OPT_REGION) $(OPT_FUNCTION) $(OPT_TFSTATE)


deploy:
	@make cpzip
	lambroll deploy $(OPT_LOG) $(OPT_PROFILE) $(OPT_REGION) $(OPT_DEPLOY_FUNCTION) $(OPT_TFSTATE) $(OPT_SRC) $(OPT_EXCLUDE) --skip-archive
dry-deploy:
	@make cpzip
	lambroll deploy $(OPT_LOG) $(OPT_PROFILE) $(OPT_REGION) $(OPT_DEPLOY_FUNCTION) $(OPT_TFSTATE) $(OPT_SRC) $(OPT_EXCLUDE) --dry-run --skip-archive

rollback:
	lambroll rollback $(OPT_LOG) $(OPT_PROFILE) $(OPT_REGION) $(OPT_FUNCTION) $(OPT_TFSTATE) --delete-version
soft-rollback:
	lambroll rollback $(OPT_LOG) $(OPT_PROFILE) $(OPT_REGION) $(OPT_FUNCTION) $(OPT_TFSTATE)
dry-rollback:
	lambroll rollback $(OPT_LOG) $(OPT_PROFILE) $(OPT_REGION) $(OPT_FUNCTION) $(OPT_TFSTATE) --dry-run
