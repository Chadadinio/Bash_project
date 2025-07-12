#!/bin/bash
# Validate that all .sh files in artifacts folder contain download and install methods

ARTIFACTS_DIR="artifacts"
for file in "$ARTIFACTS_DIR"/*.sh; do
    missing_methods=() 
    grep -q "download()" "$file" || missing_methods+=(download)
    grep -q "install()" "$file" || missing_methods+=(install)
    if [ ${#missing_methods[@]} -eq 0 ]; then
        echo "All the methods in file $file are exist"
    else
        echo "File $file is missing the following methods: ${missing_methods[*]}"
    fi
done