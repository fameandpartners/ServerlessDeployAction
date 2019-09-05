#!/bin/bash

set -e
st=$(git branch)
echo $st
st=${st##*/}
echo $st

BRANCH=$(git branch)
BRANCH=${BRANCH##*/}
STAGE="_"
pwd
ls
echo $BRANCH
echo $STAGE
if [[ "${BRANCH}"=="master" ]]; then
    STAGE="production"
elif [[ "${BRANCH}"=="develop" ]]; then
    STAGE="dev"
elif [[ "${BRANCH}"=="qa4" ]]; then
    STAGE="qa4"
fi
echo using STAGE $STAGE
