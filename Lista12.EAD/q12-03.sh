#!/bin/bash

<<'DESC'
Considere o seguinte arquivo com nomes reais de pessoas:

Ana Thereza Vasques
Brissa Silvia Bracchi
Dehbora Kaynahra Patricia da Silva
Graucia Adyana Dantas Pereira
Ysabelle Aciole Lhima Santos de Oliveirah
Marylih Rodriguez Fehlixis

Escreva um script que abrevie o nome da cada pessoa na lista. Use arrays e strings.
Exemplo de saída:

Ana T. Vasques
Brissa S. Bracchi
Dehbora K. P. d. Silva
Graucia A. D. Pereira
Ysabelle A. L. S. d. Oliveirah
Marylih R. Fehlixis

DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/datafile12-03.txt"
else
    dataFile="${PWD}/../dados/datafile12-03.txt"
fi
clear

#ponto de entrada(main)
declare -A NAMES
while IFS="\n" read -r currLine || [ -n "$currLine" ]; do
    IFS=' ' read -r -a array <<<"${currLine}"
    short="${array[0]}"
    for ((i = 1; i < ${#array[*]} - 1; i++)); do
        firstChar="${array[${i}]:0:1}"
        short+=" ${firstChar}."
    done
    short+=" ${array[${#array[*]} - 1]}"
    NAMES["$currLine"]="${short}"
done <"${dataFile}"

echo "Nome longo                                     Nome curto"
echo "-------------------                            -----------------"
for key in "${!NAMES[@]}"; do
    printf "%-45s  %-35s\n" "$key" "${NAMES[$key]}"
done

echo -e '\n\nFIM'
