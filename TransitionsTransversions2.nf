#!/usr/bin/env nextflow

# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

nextflow.enable.dsl=2



// creating pipeline input parameters_________________________________________________________________________________________________________________________________


params.input_file_name = "bos_taurus.vcf"

//params.input_files = "/mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/nextflow/projekt/input_files/"

params.input_files = "/mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/nextflow/projekt/input_files/${params.input_file_name}"

params.results_dir = "/mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/nextflow/projekt/results"


//___________________________________________________________________________________________________________________________________________________________________






// creating channels__________________________________________________________________________________________________________________________________________________



file_channel = Channel.fromPath( params.input_files, checkIfExists: true )
file_channel.view()


//__________________________________________________________________________________________________________________________________________________________________








// main workflow___________________________________________________________________________________________________________________________________________________


workflow{


FILTERING(file_channel)
BEHEADING(FILTERING.out)
EXTRACTION(BEHEADING.out)
RATIO(EXTRACTION.out)
VISUAL(RATIO.out)


}

//___________________________________________________________________________________________________________________________________________________________________






// proccecess_______________________________________________________________________________________________________________________________________________________



process FILTERING {
    


    publishDir("${params.results_dir}/after_filtering", mode: 'copy')
    
        
    input:
    path(input_files)

        
    output:
    path("*")

// może pętla

    script:
    """
    for file in /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/nextflow/projekt/input_files/*.vcf
    do
	echo /$file
    done
    """
}





process BEHEADING{

	publishDir("${params.results_dir}/no_header", mode: 'copy')


	input:
	path("${params.results_dir}/after_filtering")


	output:
	path("*")


	script:
	"""
	grep -v "##"  ${params.results_dir}/after_filtering/*vcf > no_header.vcf
	"""


}




process EXTRACTION{

	publishDir("${params.results_dir}/substitutions", mode: 'copy')


        input:
        path("${params.results_dir}/no_header")


        output:
        path("*")


	script:
	"""
	awk -F '\t' '{print \$4, \$5}' ${params.results_dir}/no_header/*vcf > substitutions.txt
	"""




}





process RATIO{

	publishDir("${params.results_dir}/ratio", mode: 'copy')


        input:
        path("${params.results_dir}/substitutions")


        output:
        path("*")


	script:
	"""
	file_path=${params.results_dir}/substitutions/*txt

	transitions=\$(grep -e 'A G' -e 'G A' -e 'C T' -e 'T C' \$file_path | wc -l)

	transversions=\$(grep -e 'A C' -e 'C A' -e 'G T' -e 'T G' -e 'A T' -e 'T A' -e 'G C' -e 'C G' \$file_path | wc -l)


	ratio=\$(echo "\$transitions / \$transversions" | bc -l)

	echo \$transitions > Transitions.txt
	
	echo \$transversions > Transversions.txt

	echo \$ratio > Ratio.txt
	"""


}






process VISUAL{

	publishDir("${params.results_dir}/visual", mode: 'copy')


        input:
        path("${params.results_dir}/ratio")


        output:
        path("*")

	
	script:
	"""
	#!/usr/bin/python3
	
	import numpy as np
	from matplotlib import pyplot as plt

	with open('${params.results_dir}/ratio/Transversions.txt','r') as file:
        transversions = file.read()

        with open('${params.results_dir}/ratio/Transitions.txt','r') as file:
        	transitions = file.read()

	data = [int(transversions), int(transitions)]
	label = ["transversions", "transitions"]

	fig = plt.figure(figsize =(10, 7))

	plt.pie(data, labels = label)

	plt.savefig('${params.results_dir}/visual/pie_chart.pdf')
	"""



}
workflow.onComplete {

   println ( workflow.success ? """
       Pipeline execution summary
       ---------------------------
       Completed at: ${workflow.complete}
       Duration    : ${workflow.duration}
       Success     : ${workflow.success}
       workDir     : ${workflow.workDir}
       exit status : ${workflow.exitStatus}


       """ : """
       Failed: ${workflow.errorReport}
       exit status : ${workflow.exitStatus}
       """
   )
}
