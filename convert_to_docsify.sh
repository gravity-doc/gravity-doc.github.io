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

# Function to process markdown files
process_markdown() {
    echo "Processing $1"
    # remove part of "--- ... ---"
    sed -i '/^---[[:space:]]*$/,/^---[[:space:]]*$/d' "$1"
    # convert HTML image to markdown image
    sed -i 's|<img src="[^"]*/images/\([^"]*\)" .* />|![\1](\0)|g' "$1"
    # Convert danger, warning, note, and tip blocks
    awk '/^```danger$/,/^```$/ {
        if ($0 == "```danger```") {
            print "  ?> **Important**"
            next
        }
        if ($0 != "```") {
            print "  >", substr($0, 5)
        }
    }
    /^```warning$/,/^```$/ {
        if ($0 == "```warning```") {
            print "  ?> **Important**"
            next
        }
        if ($0 != "```") {
            print "  >", substr($0, 5)
        }
    }
    /^```note$/,/^```$/ {
        if ($0 == "```note```") {
            print "  ?> **Important**"
            next
        }
        if ($0 != "```") {
            print "  >", substr($0, 5)
        }
    }
    /^```tip$/,/^```$/ {
        if ($0 == "```tip```") {
            print "  !> **Tip**"
            next
        }
        if ($0 != "```") {
            print "  >", substr($0, 5)
        }
    }
    { print }' "$1" > "$1.tmp" && mv "$1.tmp" "$1"
}

export -f process_markdown

# Process markdown files using find and process_markdown function
find . -type f -name "*.md" -exec bash -c 'process_markdown "$0"' {} \;

# Build Docker image of docsify
if [ -d "docs" ] && [ "$(id -u)" = "0" ]; then
    cd docs
    docker build -f Dockerfile -t docsify/demo .
    docker restart docsify
else
    echo "docs directory does not exist or you are not root"
fi

echo "Done"