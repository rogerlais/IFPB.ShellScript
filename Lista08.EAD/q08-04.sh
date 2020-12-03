#!/bin/bash

<< 'DESC'
Considere o seguinte arquivo ips.txt:

8.8.8.8
8.8.4.4
200.148.191.197
168.196.40.154
45.225.123.54
8.8.8.8
8.8.4.4
200.148.191.197
123.123.123.1
123.123.123.2
123.123.123.1
123.123.123.3
123.123.123.2

Escreva um script para listar apenas os ips sem repetição. Isto é, remover as duplicatas.

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
