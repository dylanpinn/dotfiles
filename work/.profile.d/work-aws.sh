#!/bin/sh

# Set alias for logging into AWS ECR.
alias ecr-login='rea-as okta resi-agent-prod-ReadOnly aws ecr get-login-password  | docker login --username AWS --password-stdin 639347700193.dkr.ecr.ap-southeast-2.amazonaws.com'
