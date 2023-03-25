#!/bin/bash

# # QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

awk '{if(substr($8,1,2) == "LG"){print ">" $8} else{print $0}}' GCF_003254395.2_Amel_HAv3.1_genomic.fna | sed 's/','/''/g' > Bee_changed.fna




# substr($8,1,2) ==> weź character of pozycji 1 do pozycji 2 w polu $8 (w naszym wypadku jest to "LG")


# jeśli substr($8,1,2) == "LG" to wypisz print ">" $8, jeśli nie to wypisz $0


# czyli inaczej: w nagłówkach wypisz ">" $8, natomiast poza nagłówkami nic nie zrób


# sed 's/','/''/g' poprostu wywalanie przecinków, koniecznie musi być '' zamiast ""

