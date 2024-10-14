#!/bin/bash

# Check if the tag is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <tag>"
  exit 1
fi

# Use the first argument as the tag
TAG="$1"

# Use journalctl to follow logs for the specified tag
journalctl -f -t "$TAG" | while read -r line; do
  echo "New entry: $line"

  if [[ "$line" == *"INFO"* ]]; then
    echo "Error found: $line" >>info.log
  fi
done
