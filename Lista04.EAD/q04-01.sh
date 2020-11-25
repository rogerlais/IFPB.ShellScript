#!/bin/bash

<< 'DESC'
Escreva um script chamado help_red.sh que exibe uma ajuda sobre redirecionadores. 
Para cada redirecionador estudado ( >, >>, 2>, 2>>, &>, &>>, <, <<, <<<, e | ) 
o script deve imprimir o redirecionador, uma explicação sobre o seu funcionamento e um exemplo útil de uso.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #Ajuste de depuracao
    echo 'nada' | \\dev\\nul
fi
clear

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "${RED}>${NC}\n"
echo 'Redirecionamento de saída padrão'
printf "${GREEN}Uso:${NC}\n"
echo 'srcStream > outStream'
printf "${BLUE}Exemplo:${NC}\n"
echo 'ls > lst.txt'
echo ''

printf "${RED}>>${NC}\n"
echo 'Redirecionamento de saída padrão em modo aditivo(append)'
printf "${GREEN}Uso:${NC}\n"
echo 'srcStream >> outStream'
printf "${BLUE}Exemplo:${NC}\n"
echo 'ls >> lst.txt'
echo ''

printf "${RED}2>${NC}\n"
echo 'Redirecionamento de saída de erro'
printf "${GREEN}Uso:${NC}\n"
echo 'srcStream 2> outErrStream'
printf "${BLUE}Exemplo:${NC}\n"
echo 'crazycmd 2> error.log'
echo ''

printf "${RED}2>>${NC}\n"
echo 'Redirecionamento de saída de erro em modo aditivo(append)'
printf "${GREEN}Uso:${NC}\n"
echo 'srcStream 2>> outErrStream'
printf "${BLUE}Exemplo:${NC}\n"
echo 'crazycmd 2>> error.log'
echo ''

printf "${RED}&>${NC}\n"
echo 'Redirecionamento mútuo das saídas padrão e da de erro'
printf "${GREEN}Uso:${NC}\n"
echo 'cmdStream &> outPrintStream'
printf "${BLUE}Exemplo:${NC}\n"
echo 'somecmd &> out.log'
echo ''


printf "${RED}&>>${NC}\n"
echo 'Redirecionamento mútuo das saídas padrão e da de erro em modo aditivo(append)'
printf "${GREEN}Uso:${NC}\n"
echo 'cmdStream &>> outPrintStream'
printf "${BLUE}Exemplo:${NC}\n"
echo 'somecmd &>> out.log'
echo ''

printf "${RED}<${NC}\n"
echo 'Redirecionamento da entrada padrão'
printf "${GREEN}Uso:${NC}\n"
echo 'cmdStream < inputStream'
printf "${BLUE}Exemplo:${NC}\n"
echo 'somecmd < data.dat'
echo ''

printf "${RED}<<${NC}\n"
echo 'Redirecionamento da entrada como documento(here document)'
printf "${GREEN}Uso:${NC}\n"
echo 'cmdStream <<[-][palavra] inputStream<EOL>'
printf "${BLUE}Exemplo:${NC}\n"
echo 'somefile <<-FIM'
echo 'Alimenta somefile com tabs e linhas em branco ignoradas até palavra "FIM" ser encontrada exatamente em única linha'
echo ''

printf "${RED}<<<${NC}\n"
echo 'Redirecionamento da entrada como string(here string)'
printf "${GREEN}Uso:${NC}\n"
echo 'cmdStream <<<palavra inputString<EOL>'
printf "${BLUE}Exemplo:${NC}\n"
echo 'somefile <<<FIM'
echo 'Alimenta somefile com a cadeia informada até a palavra "FIM" ser encontrada exatamente em única linha'
echo ''

printf "${RED}|${NC}\n"
echo 'Redirecionamento da saída de programa como entrada de outro'
printf "${GREEN}Uso:${NC}\n"
echo 'cmdOutStream | cmdInputStream '
printf "${BLUE}Exemplo:${NC}\n"
echo 'ls | wc -l'
echo ''


printf "${RED}Fonte: https://www.gnu.org/software/bash/manual/html_node/Redirections.html${NC}\n"

echo 'FIM'
