#!/bin/bash

<<'DESC'
Escreva um script que receba 3 nomes de arquivos como argumentos de linha de comando. 
Verifique se pelo menos 2 destes arquivos passaram do tamanho crítico, que significa ter 5 linhas ou mais.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)
count=0
echo "Operando em ${PWD}"
for args in $@; do
    echo "Testando ${args}"
    curr=$(cat ${args} | wc -l)
    echo "Linhas = ${curr}"
    if [ $curr -ge 5 ]; then
        ((count = ${count} + 1))
    fi
    if [ $count -ge 2 ]; then
        echo 'Limite de arquivos com mais de 5 linhas atingido'
        exit 1
    fi
done

echo 'Limite de linhas por aquivo não foi atingido'

echo 'FIM'
