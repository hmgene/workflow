// Define the GCS path as a parameter
//params.gcsPath = 'gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/infercnv_out/SRR12354564/map_metadata_from_infercnv.txt'

workflow {
    processExample()
}

process processExample {
    input:
    path inputFile from "gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/infercnv_out/SRR12354564/map_metadata_from_infercnv.txt" 

    output:
    path "gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/infercnv_out/SRR12354564/res.txt" 

    script:
    """
    cat ${inputFile} > ${output}
    """
    
}

