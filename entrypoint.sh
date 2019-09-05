#!/bin/bash

set -e
st=$(git branch)
echo $st
st=${st##*/}
echo $st

BRANCH=$(git branch)
BRANCH=${BRANCH##*/}
STAGE="_"
git branch -a
echo $BRANCH
echo $STAGE
if [[ $BRANCH = master ]]; then
    STAGE="production"
elif [[ $BRANCH = develop ]]; then
    STAGE="dev"
elif [[ $BRANCH = qa4 ]]; then
    STAGE="qa4"
elif [[ $BRANCH = test ]]; then
    STAGE="x"
fi
echo using STAGE $STAGE
 
