#!/bin/bash


# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

#**********************************************************************************************************************************************************************
# pobieranie plików do (nowo utworzonego) katalogu

mkdir rats_zadanie4

wget http://theta.edu.pl/wp-content/uploads/2022/11/R_norvegicus20033325665_labs.vcf_.txt -P rats_zadanie4/

wget http://theta.edu.pl/wp-content/uploads/2020/01/R_norvegicus000020085003.vcf_.txt -P rats_zadanie4/

wget http://theta.edu.pl/wp-content/uploads/2020/01/R_norvegicus20029952202.vcf_.txt -P rats_zadanie4/

#********************************************************************************************************************************************************************

for file in rats_zadanie4/R_norvegicus*

do

	echo "operating on file ###", $file # Skrypt powinien wypisywać na ekran nazwę pliku, dla którego wykonywane są poszczególne operacje, poprzedzoną ciągiem znaków „####”
	echo " " # poprostu pusta linia

	chr11=$(grep 'Chr11' $file)  # na chromosomie 11
	echo "Na chromosomie 11:_____________________________________________ "
	echo " "
	echo $chr11

	echo " "
	echo " "
	pos=$(grep '103508890' $file)     # w pozycji 103508890
	pos_version2=$(awk -F '\t' '$2 ~ /103508890/' $file)     # alternatywne rozwiazanie
	echo "Na pozycji 103508890:_________________________________________ "
	echo " "
	echo $pos

	echo " "
	echo " "
	pos_begin=$(awk -F '\t' '$2 ~ /^103/' $file)   # pozycje rozpoczynające się od "103"
	echo " "
	echo "pozycje rozpoczynające się od "103"_____________________________"
        echo " "	
	echo $pos_begin

	echo " "
	echo " "
	pos_begin_chrom=$(grep 'Chr7' $file | awk -F '\t' '$2 ~ /^103/')

	echo " pozycje rozpoczynające się od "103" zlokalizowane na chromosomie 7:_____"     
    	echo $pos_begin_chrom


	echo "*****************************************************************"
	echo "*****************************************************************"
	



done



# ************************************************************************************************************************************************************************

rm -r rats_zadanie4


echo "DONE"
