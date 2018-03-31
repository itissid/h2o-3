#!/bin/bash

set -e

# I commented this part because the AWS key is in the SSH profile
#if [ -z ${AWS_SSH_PRIVATE_KEY_FILE} ]
#then
#    echo "ERROR: You must set AWS_SSH_PRIVATE_KEY_FILE in the environment."
#    exit 1
#fi

i=0
for publicDnsName in $(cat nodes-public)
do
    i=$((i+1))
    echo Starting on node ${i}: ${publicDnsName}...
    ssh -o StrictHostKeyChecking=no ${publicDnsName} ./start-h2o-bg.sh
done

echo Success.
