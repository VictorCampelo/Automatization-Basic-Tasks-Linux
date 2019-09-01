#! /bin/bash

#Do arquivo /etc/passwd, mostra todos os
#shells (último campo) que os usuários usam.
#Não mostrar linhas repetidas.

cat /etc/passwd |awk -F ":" '{print $7}' | uniq -u

#ou

var=`cat /etc/passwd |awk -F ":" '{print $7}'`
for i in var; do
	${var2}i
	for j in var2; do
		if [[ j = ]]; then
			#statements
		fi
	done
done