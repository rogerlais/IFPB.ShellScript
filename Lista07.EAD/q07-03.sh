#!/bin/bash

<<'DESC'
Escreva um script que funcione como um explorador de arquivos. 
Exibe um menu. 
Se o usuário digitar q, sai do script. 
Se digitar d, mostra os diretórios da pasta atual. 
Se digitar f, exibe os arquivos da pasta atual. 
Se digitar v <arq>, exibe o conteúdo do arquivo <arq>. 
Se digitar cd <dir>, muda para o diretório <dir>, se este existir.
DESC

function get-key() {
    old_tty_settings=$(stty -g) # Save old settings.
    stty -icanon >/dev/null     #todo tentar sem echo posteriormente
    retval="$(head -c1)"
    stty "$old_tty_settings" # Restore old settings.
}

function clear-screen() {
    printf "\033c" #limpa a tela
}

function show-filecontent() {
    if [ -f ${1} ] && [ -r ${1} ]; then
        cat "${1}"
    else
        echo "Arquivo: ${1} não encontrado ou não pode ser lido!!!"
    fi
}

function get-argumentValue() {
    read -p "Informe o valor do argumento: " inputValue
    echo "${inputValue}"
}

function show-menu() {
    clear-screen
    test=show-test
    while [ true ]; do
        echo "D - Listar (d)iretório atual; F - Listar arquivos da (P)asta atual; V - (V)isualizar conteúdo de arquivo; C - (T)rocar o diretório atual; Q - (S)air do script"
        echo -n "Tecle sua opção:"
        get-key
        key="${retval^^}"
        echo "Tecla pressionada foi: ${key}"
        if [ "${key}" == "D" ]; then
            ls -ld */
        elif [ "${key}" == "F" ]; then
            ls -l | grep -v '^d'
        elif [ "${key}" == "V" ]; then
            fname=$(get-argumentValue)
            show-filecontent ${fname}
        elif [ "${key}" == "C" ]; then
            dirname=$(get-argumentValue)
            cd "${dirname}"
        elif [ "${key}" == "Q" ]; then
            exit 0
        else
            echo "Tecla não reconhecida"
        fi
    done
}

function main() {
    show-menu
}

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#!ponto de entrada(main)
main

echo 'FIM'
