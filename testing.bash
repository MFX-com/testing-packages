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
#current="2.0.3"
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


#
#for file in $(find ipfs/ -type f -name "*.json"); do
#  echo "JSON file: $file"
#  version=$(cat "$file" | jq -r '.["$metadata"].version')
#  echo "$version"
#
#  schema=$(cat "$file" | jq -r '.["$metadata"].type')
#  echo "$schema"
#
#  curl -X POST "https://mumbai-issuer-node-dev.nexera.id/v1/schemas" \
#    -H "accept: application/json" \
#    -H "content-type: application/json" \
#    -u "admin:FPSllsker" \
#    -d "{\"url\":\"https://raw.githubusercontent.com/MFX-com/testing-packages/main/${file}\",\"schemaType\":\"${schema}\",\"version\":\"${version}\"}"
#done

#for file in $(find polygon-id -type f -name "*.jsonld"); do
#  echo "Found jsonLD file: $file"
#  # Upload json
#  response=$(curl "https://ipfs.infura.io:5001/api/v0/add" -X POST -F file=@"$file" -u "xxx:xxx")
#  echo "$response"
#  ipfs_hash=$(echo "$response" | jq -r '.Hash')
#  echo "$ipfs_hash"
#  # Set the json file path
#  replacement=".json"
#  json_file_path="${file/.jsonld/$replacement}"
#  echo "JSON file: $json_file_path"
#  # Perform update
#  jq '.["$metadata"].uris.jsonLdContext = "ipfs://'"$ipfs_hash"'"' "$json_file_path" > temp.json && mv temp.json "$json_file_path"
#done

#
#curl -L \
#          -H "Accept: application/vnd.github+json" \
#          -H "Authorization: token xxx"\
#          -H "X-GitHub-Api-Version: 2022-11-28" \
#          -X PUT \
#          https://api.github.com/repos/MFX-com/testing-packages/branches/main/protection \
#          -d '{"enforce_admins":false, "required_pull_request_reviews":null, "required_status_checks":null, "restrictions":null}'

#changes="PR Message"
#
#for commit_hash in $(git rev-list --ancestry-path 98548050ccc8f6dfeea21e32e7f10edd9d422bf8..0121168c7cd3adb2086e3776d0128e44acca9d01); do
#    message=$(git log -n 1 --pretty=format:"%s %H" "$commit_hash" | cat)
#    changes="$changes\n$message"
#done
#
#echo -e "$changes"

# Check if yq is installed
#if ! command -v yq &>/dev/null; then
#    echo "Please install 'yq' (https://github.com/mikefarah/yq) to process YAML files."
#    exit 1
#fi
#
#
## Make the curl request and store the JSON response in a variable
#json_response=$(curl -s -X GET 'http://localhost:8888/api/v1/meters')
#
## Use jq to extract all eventType values and store them in an array
#event_types=($(echo "$json_response" | jq -r '.[].eventType'))
#
## Define the YAML file
#YAML_FILE="openmeter/config.yaml"
#
## Loop through the meters
#while IFS=$'\t' read -r slug description eventType aggregation windowSize _; do
#  if [[ " ${event_types[*]} " != *" $eventType "* ]]; then
#    json_data="{\"slug\": \"$slug\", \"description\": \"$description\", \"eventType\": \"$eventType\", \"aggregation\": \"$aggregation\", \"windowSize\": \"$windowSize\"}"
#    curl -X POST -H "Content-Type: application/json" -d "$json_data" http://localhost:8888/api/v1/meters
#  fi
#done < <(yq e '.meters[] | [.slug, .description, .eventType, .aggregation, .windowSize] | @tsv' $YAML_FILE)
