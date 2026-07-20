#!/bin/bash

# Folder gốc, mặc định là folder hiện tại
ROOT_DIR="${1:-.}"

find "$ROOT_DIR" -type f -iname "*.webp" ! -iname "*_thumbnail.webp" | while read -r file
do
    dir=$(dirname "$file")
    filename=$(basename "$file")
    name="${filename%.*}"

    output="$dir/${name}_thumbnail.webp"

    echo "Creating: $output"

    # Resize về 100x100
    sips -z 100 100 "$file" --out "$output" >/dev/null
done

echo "Done!"
