#!/bin/bash

read -p "Informe o caminho 1: " d1
read -p "Informe o caminho 2: " d2
read -p "Informe o caminho 3: " d3 

echo "Exibindo o conteúdo de ${d1}:"
ls -la ${d1}
echo "Exibindo o conteúdo de ${d2}:"
ls -la ${d2}
echo "Exibindo o conteúdo de ${d3}:"
ls -la ${d3}
