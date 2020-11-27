#!/bin/bash

<<'DESC'
Escreva um script que gere 101 números aleatórios, salvando-os, um por linha, no arquivo num.txt.
Use o comando wc para verificar se o arquivo num.txt tem realmente 101 linhas. 
Escreva um segundo script, este deve ler todos os números de num.txt e calcular a sua soma.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo 'Debug mode !' &>/dev/null
fi

START_LIMIT=1
END_LIMIT=101

#Reset arquivo de saída
printf "" &>num.txt

#Gera as linhas randomizadas
for ((i = $START_LIMIT; i <= $END_LIMIT; i++)); do
    echo "$RANDOM" >>num.txt
done
#conta as linhas salvas e compara
found=$(cat num.txt | wc -l)
if [ $found -eq $END_LIMIT ];then
    echo "Arquivo OK com ${found} linhas"
else
    echo "Falha em arquivo. Foram encontradas ${found} linhas"
fi

#itera e soma as linhas do arquivo
acc=0
for line in $(cat num.txt); do 
    acc=$((acc + line))
done
echo "A soma total das linhas é: ${acc}"


echo 'FIM'
