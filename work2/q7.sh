#!/bin/bash

#Escreva um script que monitore todos os processos do sistema
#e mantenha o registro de quantos processos filhos cada
#processo cria. Se um processo criar mais de 5 processos filhos,
# script deve gerar um alerta no log do sistema com as
#seguintes informações:
#PID do pai | Numero de filhos | PIDs dos filhos
#Ex: Processo de PID <x> criou <num> processos filhos:
#<LISTA PIDS>

var=`ps axo ppid,pid,user | grep -v PPID | grep -v root | awk '{print $1}'`
count=0
ign=""
for i in $var; do
	aux=`ps axo ppid,pid,user | grep -v PPID | grep -v root | awk '{print $1}' | grep -wc $i`
	flag=0
	for j in $ign; do
		if [[ `ps axo ppid,pid,user | grep -v PPID | grep -v root | awk '{print $1}' | grep -w $i -m 1` = $j ]]; then
			flag=1
			break
		else
			continue	
		fi
	done
	if [[ $flag -eq 0 ]]; then
		if [ $aux -gt 5 ]; then
			ign+=`ps axo ppid,pid,user | grep -v PPID | grep -v root | awk '{print $1}' | grep -w $i -m 1`" "
			ppid=`ps axo ppid,pid,user | grep -v PPID | grep -v root | awk '{print $1}' | grep -w $i -m 1`
			#nome=`ps axo ppid,pid,user,comm | grep -v PPID | grep -v root | awk '{print $4}' | grep $i`
			cpu=`ps axo ppid,pid,user,pcpu | grep -v PPID | grep -v root | awk '{print $1 " " $4}' | grep -w $i | grep -v ".$i" | grep -v " %i."`
			aux2=0
			for valor in $cpu
			do
				aux2=`echo $aux + $valor | bc -l`
			done
			echo "Processo de PPID $ppid criou $aux processos filhos com $aux2 % de uso de cpu: "
			#echo "Processo de PPID $ppid criou $aux processos filhos com $aux2 % de uso de cpu: "  >> /var/log/syslog
			#crontab -e -> coloca no final do arquivo: 
			# min hor day mon yea /media/victor/Dados/VICTOR/PESSOAL/COMPUTAÇÃO/TSO - Topicos em Sistema Operacional/shell/work2/q7.sh
		fi	
	fi
done
