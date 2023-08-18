#!/bin/bash

loki_ds="CkxljTP4z"

if [ "$1" == 'staging' ] || [ "$1" == 'prod' ]; then
  loki_ds="P8E80F9AEF21F6940"
fi

echo "$loki_ds"

find deploy/*.json -type f -exec sed -i -e "s/\${DS_LOKI}/$loki_ds/g" {} +
