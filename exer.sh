#!/bin/bash
echo -e "lista diretorios: "
ls -l /| grep ^

echo -e "particoes ativas" 
df -h -x tmpfs -x udev | grep -v loop

echo -e "memoria livre" 
free -h | grep ^Mem | awk '{print $4}'

echo -e "processos ativos para o usuario"
#no lugar de victor voce adiciona seu nome de usuario
ps aux | grep victor 
