#!/bin/bash

<<'DESC'
[PESQUISA] Quando usamos o pipe (|) para conectar dois ou mais comandos, a variável $? toma o valor de sucesso ou falha do último comando da sequência. 
Como verificar o sucesso/falha dos outros comandos na sequência do pipe.

Exemplo de sequência:
    cat a.txt | tr ‘.’ ‘,’ | sort | grep -v “x”

como saber o retorno (sucesso/falha) dos comandos sort e tr?
DESC

#Tatica 1 - usar diretamente no stream de saída/erro
cat a.txt | (
    tr ‘.’ ‘,’
    echo $? >&1
) | (
    sort
    echo $? >&1
) | grep -v “x”

#Tatica 2 - Agrupar cada operação e testar o retorno da operação anterior em blocos
cat a.txt | tr ‘.’ ‘,’ | ([[! -v $? ]] && sort || echo "atitude") | [[! -v $? ]] && grep -v “x” || echo "atitude"

echo 'FIM'
