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

response_code=$(curl -s -o /dev/null -w "%{http_code}" https://flask-news.marefx.com/test-status)
response_code_api=$(curl -s -o /dev/null -w "%{http_code}" https://api-dev-k8s.nexera.id)
response_code_cms=$(curl -s -o /dev/null -w "%{http_code}" https://cms-dev.nexera.id/healthcheck)
response_code_data_storage=$(curl -s -o /dev/null -w "%{http_code}" https://data-storage.dev.nexera.id/api/healthcheck)


printf "Response code: %d\n" "$response_code"
printf "Response code: %d\n" "$response_code_api"
printf "Response code: %d\n" "$response_code_cms"
printf "Response code: %d\n" "$response_code_data_storage"

my_timer=$(date +%s)

printf "Date: %s\n" "$my_timer"

testing="hellO"
echo "${testing^^}"

app_url="https://flask-news.marefx.com/test-status"
attempts=0
total_attempts=5
while [ $attempts -lt $total_attempts ]; do
  status_code=$(curl -s -o /dev/null -w '%{http_code}' $app_url)
  printf "The response code is: %d\n" "$status_code"

  if [ "$status_code" -eq 200 ]; then
    attempts=$((attempts+1))
    sleep 3
  else
    printf "The application has issues starting up, check the logs!"
    exit 1
  fi
done
