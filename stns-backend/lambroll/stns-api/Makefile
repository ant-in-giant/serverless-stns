.PHONY:

help:
	cat Makefile

OPT_LOG      := --log-level=info
OPT_REGION   := --region="ap-northeast-1"
OPT_FUNCTION := --function="function.json"
OPT_TFSTATE := --tfstate="../../create/terraform.tfstate"
OPT_SRC      := --src="."


cpzip:
	@if [ -f function.zip ]; \
	then \
		rm -f function.zip; \
	fi;
	cp -p ../../../module/aws-serverless-stns-api/lambda/stns-api/app.zip ./function.zip


list:
	lambroll list $(OPT_REGION)

diff:
	@make cpzip
	lambroll diff $(OPT_LOG) $(OPT_REGION) $(OPT_FUNCTION) $(OPT_TFSTATE)
