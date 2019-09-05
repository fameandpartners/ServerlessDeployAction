#!/bin/bash

set -e

if [[ -z "$STAGE" ]]; then
    echo STAGE invalid
    exit 1
fi

if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
    echo AWS Access Key ID invalid
    exit 1
fi

if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
    echo AWS Secret Access Key invalid
    exit 1
fi

pwd
ls
cd $PACKAGE_DIR
ls
./build.sh
serverless plugin install --name serverless-apigw-binary
serverless plugin install --name serverless-domain-manager
serverless config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY
serverless deploy -s $STAGE
