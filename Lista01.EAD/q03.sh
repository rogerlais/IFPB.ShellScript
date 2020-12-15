#!/bin/bash

clear
i=1
for dir in "$@"; do
    echo "listando diretório(${i}): ${dir}"
    ls -la "${dir}"
    i=$((i + 1))
    if ((i >= 4)); then
        break
    fi
done
echo "fim"
