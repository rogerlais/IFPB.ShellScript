#!/bin/bash

<< 'DESC'
Escreva um script que receba 3 nomes de arquivos como argumentos de linha de comando. 
Verifique se pelo menos 2 destes arquivos passaram do tamanho crítico, que significa ter 5 linhas ou mais.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" > /dev/null
fi
clear


#ponto de entrada(main)


echo 'FIM'
