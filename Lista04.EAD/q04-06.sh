#!/bin/bash

<< 'DESC'
Considere o script apresentado na questão anterior. Suponha que você queira substituir todo ‘:’ da saída por ‘-’. Seria simples executar

./loop.sh | tr ‘:’ ‘-’

contudo este comando não faz substituições na saída de erros. Como usar redirecionadores de modo que o comando tr consiga substituir os caracteres tanto da saída de erro quanto da saída padrão?

DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #Ajuste de depuracao
fi

#solução encontrada em: https://askubuntu.com/questions/625224/how-to-redirect-stderr-to-a-file
./loop.sh 2>&1 | tr ‘:’ ‘-’

echo 'FIM'
