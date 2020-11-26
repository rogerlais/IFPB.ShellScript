#!/bin/bash

<< 'DESC'
Escreva um script que gere 101 números aleatórios, salvando-os, um por linha, no arquivo num.txt.
Use o comando wc para verificar se o arquivo num.txt tem realmente 101 linhas. 
Escreva um segundo script, este deve ler todos os números de num.txt e calcular a sua soma.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
fi

echo 'FIM'
