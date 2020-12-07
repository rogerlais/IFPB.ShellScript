#!/bin/bash

<<'DESC'
Dado um arquivo cuja primeira linha é o título e as linhas seguintes são ítens de uma lista. 
Escreva um script que crie um arquivo html completo usando o conteúdo do arquivo de entrada. 
Exemplo de arquivo:

    Lista de IPs
    8.8.8.8
    8.8.4.4
    127.0.0.1
    123.123.123.1
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/dataFile10-02.txt"
    templateFile="${PWD}/dados/template.html"
    outFile="${PWD}/dados/report.html"
else
    dataFile="${PWD}/../dados/dataFile10-02.txt"
    templateFile="${PWD}/../dados/template.html"
    outFile="${PWD}/report.html"
fi
clear

#ponto de entrada(main)
lineCount=1
line=$(sed -n "${lineCount}"p "${dataFile}")
content="<h1>${line}</h1>\n<ol type="1">\n" #header + Ordered List
echo -e "${content}"
while [ -n "${line}" ]; do
    ((lineCount++))
    line=$(sed -n "${lineCount}"p "${dataFile}")
    if [ -n "${line}" ]; then
        content+="<li>${line}</li>\n"
    fi
done
content+='</ol>' #fechamento da lista

#Troca o content obtido no template
echo "Salvando o relatório em: ${outFile}"
#echo -e "Argument:\ns|#CONTENT#|${content}|g"
#sed "s|#CONTENT#|${content}|g" "${templateFile}"
sed "s|#CONTENT#|${content}|g" "${templateFile}" >"${outFile}"

echo 'FIM'
