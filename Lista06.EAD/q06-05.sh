#!/bin/bash

<<'DESC'
Escreva um script que imprima a palavra DIRETORIOS e abaixo liste todos os diretórios da pasta atual. 
Em seguida imprima a palavra ARQUIVOS e abaixo liste todos os arquivos da pasta atual. 
Por fim, imprima a palavra LINKS e abaixo liste todos os links simbólicos da pasta atual.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)
echo "DIRETORIOS"
for entry in *; do
    [ -d $entry ] && echo "${entry}"
done

echo "ARQUIVOS"
for entry in *; do
    [ -f $entry ] && echo "${entry}"
done

echo "LINKS"
for entry in *; do
    [ -h $entry ] && echo "${entry}"
done



echo 'FIM'
