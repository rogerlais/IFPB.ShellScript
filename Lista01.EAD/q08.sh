#!/bin/bash

A=$(ls -l ${1}) #subs de argumento(var)  cascateada por subst de shell(avalia comando)
B=$(ls -l ${2})
C=$(ls -l ${3})

echo -e "$A\n$B\n$C" > info.txt
