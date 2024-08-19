#!/bin/bash
# This script will install additional plugins from the plugins.txt file

set -e

if [[ ! -f plugins.txt ]]; then
    echo "plugins.txt not found!"
    exit 1
fi

echo "Installing plugins from plugins.txt file..."
# loop over each line in the plugins.txt file

while IFS='' read -r line || [[ -n "$line" ]]; do
    # Skip empty lines or lines starting with #
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    # split the line into an array using the delimiter '=='
    IFS='=' read -r plugin_name plugin_url <<< "$line"
    echo "Installing plugin $plugin_name from $plugin_url"
    # download the plugin from the url
    wget "$plugin_url" -O ./plugin.vsix
    unzip ./plugin.vsix -d ./plugins/$plugin_name
    rm ./plugin.vsix
    chown -R user:user ./plugins/$plugin_name

done < plugins.txt

echo "Done installing plugins from plugins.txt file."