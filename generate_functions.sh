#!/usr/bin/env bash

# Remove existing .functions file if it exists
rm -f .functions

# Find all .sh files recursively, excluding this script
find . -type f -name "*.sh" ! -name "generate_functions.sh" | while read -r script_file; do
    echo "Processing: $script_file"
    
    # Extract function definitions from the script
    # This matches: function function_name() { or function function_name {
    # Allows hyphens, underscores, alphanumeric in function names
    if grep -qE "^[[:space:]]*function[[:space:]]+[a-zA-Z_][a-zA-Z0-9_-]*[[:space:]]*(\(\))?" "$script_file"; then
        echo "  Found functions in: $script_file"
        # Append to .functions file with source command
        echo "source \"$script_file\"" >> .functions
    fi
done

if [ -f .functions ]; then
    echo "Done! Functions extracted to .functions"
else
    echo "No functions found in any .sh files"
fi
