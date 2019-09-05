#!/bin/bash

set -e
st=$(git branch)
echo $st
st=${st##*/}
echo $st
