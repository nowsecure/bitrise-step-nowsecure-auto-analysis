#!/bin/bash
set -ex

# Required parameters
if [ -z "${nowsecure_api_token}" ] ; then
  echo " [!] Missing required input: nowsecure_api_token"
  exit 1
fi

if [ -z "${upload_path}" ] ; then
  echo " [!] Missing required input: upload_path"
  exit 1
fi


if [[ $nowsecure_group_id ]]
then
  output=$(curl -H "Authorization: Bearer $nowsecure_api_token" -X POST https://lab-api.nowsecure.com/build/?group=$nowsecure_group_id --http1.1 --data-binary @$upload_path -f)
else
  output=$(curl -H "Authorization: Bearer $nowsecure_api_token" -X POST https://lab-api.nowsecure.com/build/ --http1.1 --data-binary @$upload_path -f)
fi

exit $?
