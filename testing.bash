#!/bin/bash

#loki_ds="CkxljTP4z"
#
#if [ "$1" == 'staging' ]; then
#  loki_ds="P8E80F9AEF21F6940"
#elif [ "$1" == 'prod' ]; then
#  loki_ds="P8E80F9AEF21F6940"
#fi
#
#echo "$loki_ds"
#
#find deploy/*.json -type f -exec sed -i -e "s/\${DS_LOKI}/$loki_ds/g" {} +

#response_code=$(curl -s -o /dev/null -w "%{http_code}" https://flask-news.marefx.com/test-status)
#response_code_api=$(curl -s -o /dev/null -w "%{http_code}" https://api-dev-k8s.nexera.id)
#response_code_cms=$(curl -s -o /dev/null -w "%{http_code}" https://cms-dev.nexera.id/healthcheck)
#response_code_data_storage=$(curl -s -o /dev/null -w "%{http_code}" https://data-storage.dev.nexera.id/api/healthcheck)
#
#
#printf "Response code: %d\n" "$response_code"
#printf "Response code: %d\n" "$response_code_api"
#printf "Response code: %d\n" "$response_code_cms"
#printf "Response code: %d\n" "$response_code_data_storage"
#
#my_timer=$(date +%s)
#
#printf "Date: %s\n" "$my_timer"
#
#testing="hellO"
#echo "${testing^^}"
#
#app_url="https://flask-news.marefx.com/test-status"
#attempts=0
#total_attempts=5
#while [ $attempts -lt $total_attempts ]; do
#  status_code=$(curl -s -o /dev/null -w '%{http_code}' $app_url)
#  printf "The response code is: %d\n" "$status_code"
#
#  if [ "$status_code" -eq 200 ]; then
#    attempts=$((attempts+1))
#    sleep 3
#  else
#    printf "The application has issues starting up, check the logs!"
#    exit 1
#  fi
#done


#changes="$(git log --pretty=oneline 71bcdec22ff0c63384e2a36a5be72a6cf8faf4cc -n 1 | cat -)"
#
#echo "$changes"
#
#
#current="2.0.1"
#target=$(semver bump patch $current)
#
#echo "$target"

#original_string="This is the original string"
#replacement="replacement_string"
#new_string="${original_string/original/$replacement}"
#echo "$new_string"
#
#
#for file in $(find polygon-id/ -type f -name "*.jsonld"); do
#    echo "Found JSON file: $file"
#    # You can perform actions on each file here
#    replacement=".json"
#    new_string="${file/.jsonld/$replacement}"
#    echo "$new_string"
#done

#ipfs_hash="123"
#json_file_path="polygon-id/id3/id3.json"
#jq '.["$metadata"].uris.jsonLdContext = "'$ipfs_hash'"' $json_file_path > temp.json


for file in $(find polygon-id -type f -name "*.jsonld"); do
  echo "Found jsonLD file: $file"
  # Upload json
  response=$(curl "https://ipfs.infura.io:5001/api/v0/add" -X POST -F file=@"$file" -u "xxx:xxx")
  echo "$response"
  ipfs_hash=$(echo "$response" | jq -r '.Hash')
  echo "$ipfs_hash"
  # Set the json file path
  replacement=".json"
  json_file_path="${file/.jsonld/$replacement}"
  echo "JSON file: $json_file_path"
  # Perform update
  jq '.["$metadata"].uris.jsonLdContext = "ipfs://'"$ipfs_hash"'"' "$json_file_path" > temp.json && mv temp.json "$json_file_path"
done

#
#curl -L \
#          -H "Accept: application/vnd.github+json" \
#          -H "Authorization: token xxx"\
#          -H "X-GitHub-Api-Version: 2022-11-28" \
#          -X PUT \
#          https://api.github.com/repos/MFX-com/testing-packages/branches/main/protection \
#          -d '{"enforce_admins":false, "required_pull_request_reviews":null, "required_status_checks":null, "restrictions":null}'
