#!/bin/bash
################### convert_to_docsify.sh ###################
# This script is used to convert the original markdown files
# to docsify markdown files.
#############################################################
set -e

# Check if the script is running inside a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "This script must be run inside a Git repository!!!"
    exit 1
fi

source_file="docs/index.md"
target_file="docs/README.md"

# Check if source file exists
if [ ! -f "$source_file" ]; then
    echo "source file $source_file does not exist"
else
    # Rename file
    mv "$source_file" "$target_file"
fi

# Delete start part of the file using awk
find . -type f -name "*.md" -exec awk '/^---$/ { p = !p; next } !p' {} > {}.tmp && mv {}.tmp {} \;

# # Convert images path using sed
# find . -type f -name "*.md" -exec sed -i 's|\.\./images/\(.*\.png\)|./images/\1|g' {} +

# Build Docker image of docsify
if [ -d "docs" ] && [ "$(id -u)" = "0" ]; then
    cd docs
    docker build -f Dockerfile -t docsify/demo .
    docker restart docsify
else
    echo "docs directory does not exist or you are not root"
fi