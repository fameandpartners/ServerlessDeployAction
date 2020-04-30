#!/bin/bash

set -e

if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
    echo AWS Access Key ID invalid
    exit 1
fi

if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
    echo AWS Secret Access Key invalid
    exit 1
fi
echo current directory:
pwd
echo current ref: $GITHUB_REF
BRANCH=${GITHUB_REF##*/}
STAGE="_"
if [[ $BRANCH = master ]]; then
    STAGE="production"
elif [[ $BRANCH = develop ]]; then
    STAGE="dev"
elif [[ $BRANCH = qa4 ]]; then
    STAGE="qa4"
fi
echo current branch: $BRANCH
echo using STAGE $STAGE

cd $PACKAGE_DIR
./build.sh
if [[ $BRANCH != _ ]];then
    #uncomment the below line to enable debug
    #export SLS_DEBUG=*
    echo start severless deploy
    serverless plugin install --name serverless-apigw-binary
    serverless plugin install --name serverless-domain-manager
    serverless config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY
    serverless deploy -s $STAGE
fi
