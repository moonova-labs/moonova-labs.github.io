#!/bin/bash

ROOT_DIR="${1:-.}"

find "$ROOT_DIR" -type f -iname "*.webp" ! -iname "*_thumbnail.webp" | while IFS= read -r file
do
    output="${file%.webp}_thumbnail.webp"

    echo "Creating $output"

    cwebp \
        -resize 100 100 \
        -q 90 \
        "$file" \
        -o "$output" >/dev/null
done

echo "Done!"
