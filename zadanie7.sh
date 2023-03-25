#!/bin/bash

# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

for file in /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/kolos/kolokwium_files/*.rmdup.fs

do
	name=$(basename $file)
	echo $name

	properly_num=$(awk -F '+' '{print $1}' $file | head -n 7 | tail -n 1)
	echo 'properly paired number: ' $properly_num

	properly_perc=$(grep '%' $file | head -n 2 | tail -n 1 | awk -F '(' '{print $2}' | awk -F '%:' '{print $1}')
	echo 'properly paired percentage: ' $properly_perc

	echo "______________________________________________________________________________________________________________________________"	


done


echo "done"
