#!/bin/bash

<< 'DESC'
comments...
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #Ajuste de depuracao
fi

echo 'FIM'
