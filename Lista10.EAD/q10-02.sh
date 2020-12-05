#!/bin/bash

<< 'DESC'
Dado um arquivo cuja primeira linha é o título e as linhas seguintes são ítens de uma lista. Escreva um script que crie um arquivo html completo usando o conteúdo do arquivo de entrada. Exemplo de arquivo:

    Lista de IPs
    8.8.8.8
    8.8.4.4
    127.0.0.1
    123.123.123.1
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
