#!/bin/bash
set -ex

if [[ $nowsecure_group_id ]]
then
  output=$(curl -vv -H "Authorization: Bearer $nowsecure_api_token" -X POST https://lab-api.nowsecure.com/build/$nowsecure_group_id --data-binary @$upload_path)
else
  output=$(curl -vv -H "Authorization: Bearer $nowsecure_api_token" -X POST https://lab-api.nowsecure.com/build/ --data-binary @$upload_path)
fi

echo $output | jq -je .ref
if [ $? ]
  exit 1
fi
exit 0