#!/bin/bash
set -ex

# TODO: Update to handle curl errors (unable to upload / network issues)

if [[ $nowsecure_group_id ]]
then
  output=$(curl -H "Authorization: Bearer $nowsecure_api_token" -X POST https://lab-api.nowsecure.com/build/?group=$nowsecure_group_id --data-binary @$upload_path)
else
  output=$(curl -H "Authorization: Bearer $nowsecure_api_token" -X POST https://lab-api.nowsecure.com/build/ --data-binary @$upload_path)
fi
