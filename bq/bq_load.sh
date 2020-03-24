#!/usr/bin/env bash

VERSION=$1

bq load \
    --source_format=NEWLINE_DELIMITED_JSON \
    playground-272019:example_dataset.example_table \
    ./data$VERSION.json \
    ./schema$VERSION.json
