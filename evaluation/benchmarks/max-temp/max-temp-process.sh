#!/bin/bash

## Processing
# cat $IN |
#     cut -c 89-92 |
#     grep -v 999 |
#     sort -rn |
#     head -n1


temp_file=$(mktemp)

cat $IN |
    cut -c 89-92 |
    grep -v 999 |
    sort -rn > "$temp_file"

cat "$temp_file" |
    head -n1 > max.txt

rm "$temp_file"