#!/bin/bash

#Autor: Jonathas Batista
#Descrição: Converte um arquivo .PDF para .TXT para utilização específica de uma empresa.
#versão: 0.1 linux
#licença: MIT License

ARQUIVO="$HOME/modelocsv.csv"
TOWORK="$HOME/abem-formatada.xls"

function analiticaPdf(){
        echo "Convertendo a analítica..."
        pdftotext -layout /home/jon/Downloads/pdf-analitica-abem.pdf - | sed '$d' >> $ARQUIVO
}

function twork(){
	echo "Editando a analítica em fomarto para trabalhar..."
	sed 's/ ./&xx/' $ARQUIVO | grep MENSALIDADE | cut -c 11- | sed 's/MENSALIDADE/,/' | sed 's/ //'\
	| sed 's/ /,/' | sed 's/  //' | sed 's/ //' | sed 's/ABEM//' | sed 's/AFTERJ//' | sed 's/ OK//'\
     	| sed 's/  OK//' | sed 's/,00*/,/' | sed 's/R$ //' | sed 's/    //' | sed 's/,/xwyz/'\
       	| sed 's/ ,/wxyz/' | sed 's/, /xy/' | sed 's/yz//' | sed 's/wx//' | sed 's/xw/,/ ; s/yz/,/'\
       	| sed 's/xy.*//' | cut -c2- | sed 's/.\{3\}/&./' > $TOWORK
		
}

	analiticaPdf
	sleep 1s
	echo "Seu arquivo XLS foi gerado."
	
	twork
	sleep 1s
	echo "Pronto! Seu arquivo está pronto para trabalhar."

	mv $ARQUIVO /home/jon/learn_code/linux_curso
