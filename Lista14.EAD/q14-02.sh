#!/bin/bash

echo '{
Escreva um script que remova todos os arquivos da pasta /home/<seu_user>/tmp. 
Faça que este script seja executado todas as vezes que o computador for ligado.
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

function remove_tempFiles() {
    targetDir="$HOME/tmp"
    rm -R -f "$targetDir" #Pior que vai
    mkdir "$targetDir"
}

function update_rclocal() {
    rcFile='/etc/rc.local'
    expectedFileHeader='#!/bin/bash'
    if [ -f "$rcFile" ]; then
        fileHeader=$(head -n 1 <$rcFile)
        if ! sed -n "1{/^$expectedFileHeader/p};q" $rcFile; then
            tmp=$(mktemp /tmp/ssscript.XXXXXX)
            cp "$rcFile" "$tmp"
            sudo echo "$expectedFileHeader" >$rcFile
            cat "$tmp" >>$rcFile
        fi
    else
        echo "$expectedFileHeader" >$rcFile
    fi
}

#Grava todos os arquivos acessórios para a funcionalidade
function write_extraFiles() {
    targetDir=~/"scripts/"
    scriptFile="${targetDir}cleartmp.sh"
    if [ ! -d "$targetDir" ]; then
        mkdir "$targetDir"
    fi
    subScriptContent=$(type remove_tempFiles | sed '1,3d;$d') #Custou a achar isso..... até que bash não é tão ruim assim rsrssr
    echo "$fileHeader" >"$scriptFile"
    echo "$subScriptContent" >>"$scriptFile"
    chmod u=+rwx "$scriptFile"
}

function main() {
    remove_tempFiles #apenas para testar
    update_rclocal
    write_extraFiles
}

#ponto de entrada(main)
main

echo 'FIM'
