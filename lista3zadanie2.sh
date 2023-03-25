#!/bin/bash

# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

sed -E 's/^.*group *([^,]+).*$/\1/g' Bee.fasta | sed 's/unlocalized genomic scaffold//g' > Bee_new.fasta




# explanation

# -E ==> use extender regular expressions
# ^. ==> kropka musi być na początku
# *group *  ==> lines that contain the string "group"


# \1 ==> substitue by the first match of the regex
