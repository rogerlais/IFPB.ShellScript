#!/bin/bash

<<'DESC'
Considere o seguinte arquivo ips.txt:
8.8.8.8
8.8.4.4
200.148.191.197
168.196.40.154
45.225.123.54
Use um laço while para executar 4 pings para cada ip. Liste os IPs que não foram possíveis acessar.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)
ipList='8.8.8.8
8.8.4.4
200.148.191.197
168.196.40.154
45.225.123.54'

while IFS="" read -r currIP || [ -n "$currIP" ]; do
    echo "Testando ${currIP}"
    ping -q -W 2 -c 4 "${currIP}" >/dev/null 2>/dev/null && dummy="TRUE" || dummy="FALSE"  #basta um dos pacotes falhar para falso
    #dummy=$(ping -q -W 2 -c 1 "${currIP}" 2>/dev/null)
    if [ "${dummy}" == "FALSE" ]; then
        echo "Falha para o endereço: ${currIP}"
    else
        echo "SUCESSO para o endereço: ${currIP}"
    fi
done <<<${ipList}

echo 'FIM'
