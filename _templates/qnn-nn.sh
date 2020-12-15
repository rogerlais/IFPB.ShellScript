#!/bin/bash

echo '{
comments...
}' >/dev/null

#dados forcados
if [[ ${DBG^^} == "'YES'" ]]; then #depurador avalia '[[ 'YES' == YES ]]' como verdadeiro
    DBG_ENV=true
else
    DBG_ENV=false
fi
export DBG_ENV

if ${DBG_ENV}; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)

echo 'FIM'
