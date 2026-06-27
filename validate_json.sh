#!/bin/bash
find . -name "*.json" -exec sh -c 'jq empty "$1" 2>&1 || echo "Error in file: $1"' _ {} \;
