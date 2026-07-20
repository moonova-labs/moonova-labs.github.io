#!/bin/bash

ROOT_DIR="${1:-.}"

find "$ROOT_DIR" -type f -iname "*.webp" ! -iname "*_thumbnail.webp" | while IFS= read -r file
do
    output="${file%.webp}_thumbnail.webp"

    echo "Creating $output"

    dwebp "$file" -ppm -o - \
    | cwebp -resize 100 100 -q 90 -- -o "$output" >/dev/null
done

echo "Done!"
