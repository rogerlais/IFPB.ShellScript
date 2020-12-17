#!/bin/bash

echo '{
comments...
}' >/dev/null

#dados forcados
if [[ ${DBG^^} == "'YES'" ]]; then #depurador avalia '[[ 'YES' == YES ]]' como verdadeiro
    DBG_ENV=true                   #*Este é o conceito de verdadeiro em Bash. Nos testes usar a forma if $DBG_ENV; then e NUNCA if [[ $DBG_ENV ]]; then
    DBG_CMDLINE=$(<"/proc/$PPID/cmdline")
    DBG_MAIN_SCRIPT=$(grep -oP "(?<=-- )[^ ]+" <<<"$DBG_CMDLINE") #todo ainda precisa de teste para aprovação
    export DBG_CMDLINE, DBG_MAIN_SCRIPT
else
    DBG_ENV=false
fi
export DBG_ENV

if $DBG_ENV; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)
echo "${DBG^^}"
echo -e "cmd= $DBG_CMDLINE"
echo -e "args= $DBG_MAIN_SCRIPT"

echo 'FIM'
