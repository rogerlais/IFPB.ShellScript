#!/bin/bash

A=$(ls -l ${1})
B=$(ls -l ${2})
C=$(ls -l ${3})

echo -e "$A\n$B\n$C" > info.txt
