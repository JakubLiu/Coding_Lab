#!/bin/bash

# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------


mkdir rat_zadanie5

wget http://theta.edu.pl/wp-content/uploads/2022/11/R_norvegicus20033325665_labs.vcf_.txt -P rat_zadanie5/

wget http://theta.edu.pl/wp-content/uploads/2020/01/R_norvegicus000020085003.vcf_.txt -P rat_zadanie5/

wget http://theta.edu.pl/wp-content/uploads/2020/01/R_norvegicus20029952202.vcf_.txt -P rat_zadanie5/



for file in rat_zadanie5/R_norvegicus*

do
	total=$(awk -F '\t' '{print $10}' $file | awk -F ':' '{print $1}' | wc -l)
	
	ref_homozygote=$(awk -F '\t' '{print $10}' $file | awk -F ':' '{print $1}' | grep '0/0' | wc -l)

	alt_homozygote=$(awk -F '\t' '{print $10}' $file | awk -F ':' '{print $1}' | grep '1/1' | wc -l)

	heterozygote=$(awk -F '\t' '{print $10}' $file | awk -F ':' '{print $1}' | grep '0/1' | wc -l)

	echo $file
	echo " "
	echo " reference homozygote share"
	ref_homozygote_share=$(expr $ref_homozygote/$total)
	ref_homozygote_share_2=$(echo " $ref_homozygote / $total" | bc -l)    # alternatywne rozwiazanie, mozna takze zastosowac dla innych w tej petli
	echo $ref_homozygote_share
	echo $ref_homozygote_share_2
	echo " "
	echo "alternative homozygote share"
	alt_homozygote_share=$(expr $alt_homozygote/$total)
	echo $alt_homozygote_share
	echo " "
	echo "heterozygote share"
	heterozygote_share=$(expr $heterozygote/$total)
	echo $heterozygote_share
	echo " "
	echo "*************************************************************************************************"


done







rm -r rat_zadanie5
