#!/bin/bash

<<'DESC'
Escreva um script que remova as linhas em branco de um arquivo. 
Adicione uma opção para que o script conte as linhas em branco de um arquivo, em vez de removê-las.
DESC

#dados forcados
echo "${DBG^^}"
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")
echo "${DBG_ENV}"
if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    targetFile="${PWD}/dados/datafile09-02.txt"
else
    targetFile=''
fi
clear

#ponto de entrada(main)
OPTIND=1 # Reset in case getopts has been used previously in the shell.
while getopts ":f:l|c" opt; do
    case "$opt" in
    c) #count blank lines
        listOnly=0
        ;;
    l) #listar linas não nulas apenas
        listOnly=1
        ;;
    f) #Capturar nome do arquivo para exibição
        targetFile=${OPTARG}
        ;;
    esac
done
OPTIND=1
shift $((OPTIND - 1)) #!Retorna ao status quo.... neste caso de agora.... pra que mesmo?
#recupera nome do arquivo para operação
if [ ! -n "${targetFile}" ] && ! ((${DBG_ENV})); then
    targetFile="${@: -1}" #!Leitura do último argumento passado
fi

echo -n "Arquivo de entrada: ${targetFile} no modo de "
(($listOnly)) && echo "leitura" || echo "contagem"

if (($listOnly)); then
    grep . "${targetFile}" #qq caracter tá valendo na linha
else
    echo "Possui $( grep -cvP '\S' "${targetFile}" ) linhas em branco"
fi

echo 'FIM'
