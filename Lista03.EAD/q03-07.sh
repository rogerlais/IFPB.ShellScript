#!/bin/bash

<< 'DESC'
Escreva um script que use o comando id para verificar se o mesmo foi executado com usuário root. Caso positivo, deve exibir uma mensagem de erro e sair do script. 
Use substituição de shell e os operadores condicionais (&& e || ) para resolver este problema em apenas uma linha.
DESC

[[ $(id -u root) == $( id -u ) ]]&& echo "Execucao proibida como root" && exit 

echo 'FIM'
