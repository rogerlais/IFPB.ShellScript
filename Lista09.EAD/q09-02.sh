#!/bin/bash

<<'DESC'
Escreva um script que remova as linhas em branco de um arquivo. Adicione uma opção para que o script conte as linhas em branco de um arquivo, em vez de removê-las.
DESC

#dados forcados
echo "${DBG^^}"
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")
echo "${DBG_ENV}"
if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    targetFile="${PWD}/dados/datafile09-02.txt"
fi
clear

#ponto de entrada(main)
OPTIND=1 # Reset in case getopts has been used previously in the shell.
while getopts ":l|c" opt; do
    case "$opt" in
    c)
        #clean the spaces
        listOnly="FALSE"
        ;;
    l)
        #listar apenas, sem reomver
        listOnly="TRUE"
        ;;
    esac
done
#recupera nome do arquivo para operação
if [["${DBG^^}" != "YES" ]]; then
    targetFile=${1}
fi
OPTIND=1
shift $((OPTIND - 1)) #!Retorna ao status quo.... neste caso de agora.... pra que mesmo?

echo 'FIM'
