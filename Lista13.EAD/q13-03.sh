#!/bin/bash

<< 'DESC'
Escreva um script que tenha uma função ping_test. 
Esta recebe um endereço IP como parâmetro, pinga para este IP (sem exibir nada na tela) e exibe OK se o endereço estiver acessível e FALHA caso contrário.

DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" > /dev/null
fi
clear


#ponto de entrada(main)

echo 'FIM'
