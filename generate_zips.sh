#!/bin/bash

COLORS_DIR="./colors"
MASTER_ZIP="master_themes.zip"

rm -f "$MASTER_ZIP"

for json_file in "$COLORS_DIR"/*.json; do
    if [ -f "$json_file" ]; then
        base_name=$(basename "$json_file" .json)
        cp "$json_file" settings.json
        zip "$base_name.zip" settings.json
        rm settings.json
    fi
done

zip "$MASTER_ZIP" base16-*.zip
rm base16-*.zip

echo "Master zip created: $MASTER_ZIP"