#!/bin/bash

<< 'DESC'
Escreva um script que crie 26 diretórios com nomes de A a Z. 
Dentro de cada diretório criado deve ser criado um arquivo com o nome do diretório e extensão .py (exemplo A.py, B.py ...). 
O conteúdo de cada um destes arquivos deve ser:

#!/usr/bin/env python3
print(“Rapi Hellow Uin!”)

Lembre de dar permissão de execução para cada arquivo gerado.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo 'Debug mode !' &>/dev/null
    targetDir=/tmp/lista5
else
    targetDir=${PWD}
fi

mkdir ${targetDir} #garante o base

for name in {A..Z}; do
    mkdir "${targetDir}/${name}"
    printf '#!/usr/bin/env python3
print(“Rapi Hellow Uin!”)
' > "${targetDir}/${name}/${name}.py"
    chmod +x "${targetDir}/${name}/${name}.py"
done

echo 'FIM'
