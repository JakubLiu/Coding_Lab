#!/bin/bash

# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

mkdir files

wget -i /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/rmdup_files.txt -P files/    # pobieranie plików do nowo stworzoneg katalogu



for file in files/*.rmdup_.fs_.txt    # pętla kręcąca się po zawartości katalogu

do	


	# całkowita liczba odczytów (podpunkt b)
	total_reads=$(awk -F ' ' '{print $1}' $file | head -n 1)  
	echo 'The total reads for file' $file 'are' $total_reads


        # zbieranie procentów przyrównań (podpunkt c)
	grep 'mapped (' $file | awk -F ' ' '{print $1}' >> mapped.txt


        # średnie pokrycie genomu dla każdego z osobników (podpunkt d)
	r1=$(grep 'read1' $file | awk -F '+' '{print $1}')
	r2=$(grep 'read2' $file | awk -F '+' '{print $1}')
	r=$(($r1 + $r2))   # dodawanie dwóch zmiennych w bashu
	d=269756
	coverage=$[$total_reads*$r/$d]                   # operacje na zmiennych metoda 1
	coverage2=$(echo "$total_reads*$r/$d" | bc -l)   # operacje na zmiennyh metoda 2

	echo $coverage >> coverage.txt


        # pobieranie nazw osobników (podpunkt d)
	name=$(basename $file)
	echo $name >> names.txt
done



# (podpunkt c)
max=$(sort mapped.txt | tail -n 1)
min=$(sort mapped.txt | head -n 1)



echo 'the max mapping value is' $max
echo 'the minimum mapping value is' $min

# (podpunkt d)
paste names.txt coverage.txt > id_cov.txt


rm mapped.txt
rm names.txt
rm coverage.txt
rm -r files
