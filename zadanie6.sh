#!/bin/bash



for file in /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/kolos/kolokwium_files/Hsapiens*


do
	name=$(basename $file)
	echo $name
	chr1_del=$(grep 'deletion' $file | grep 'chr1' | wc -l)
	echo $chr1_del

	new_filename=$(basename $file | sed 's/txt/out/g')
	grep 'deletion' $file | grep 'chr1' | awk -F '\t' '{print $2}' > $new_filename





done


echo "done"
