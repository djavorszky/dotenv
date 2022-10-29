#!/bin/bash

for dir in */; do
  echo "installing ${dir}"
  # d contains a trailing slash (/)
  ./"${dir}"install.sh
done
