#!/usr/bin/env bash
set -e

# Launch tests for each language and deploy if succeed
export KUZZLE_HOST=kuzzle

sdks=(java cpp)

for sdk in ${sdks[@]}; do
    echo -e "\n----------------------------------------------------------------\n"
    figlet "$sdk SDK Tests"
    echo -e "\n----------------------------------------------------------------\n"
    sh internal/wrappers/features/run_$sdk.sh

    if [[ $? -ne 0 ]]; then
      exit 1
    fi
done
