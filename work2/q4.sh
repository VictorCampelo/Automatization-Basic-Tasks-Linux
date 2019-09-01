#!/bin/bash

#Desenvolva um script que apresente na tela os usuários 
#cadastrados no sistema e os seus respectivos diretórios home.

cat /etc/passwd | awk -F ":" '{print $1 " - " $6}'