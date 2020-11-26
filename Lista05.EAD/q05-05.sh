#!/bin/bash

<< 'DESC'
Escreva um script que receba vários nomes de arquivo como parâmetros 
de linha de comando (o número de parâmetros pode variar de execução para execução)
e imprima o nome de cada arquivo passado seguido de SIM, caso o arquivo exista, e de NAO caso contrário.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
fi

echo 'FIM'
