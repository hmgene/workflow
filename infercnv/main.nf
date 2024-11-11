nextflow.enable.dsl=2
params.input = 'millerlab-bucket' 

process list_gcs_files {
    container = "twokims/infercnv-x"
    input:
    val i

    output:
    path "results.txt"  // Output the results to a file

    script:
    """
    set -e
    #export GOOGLE_APPLICATION_CREDENTIALS=/root/service-account-key.json
    #gcloud auth activate-service-account --key-file=/root/service-account-key.json
    gcsfuse ${i} /mnt/data
    ls /mnt/data > results.txt
    which inferCNV.R >> results.txt
    """
}

workflow {
    list_gcs_files(params.input)
    res = list_gcs_files.out
    res.each { f -> f.text.eachLine {  l -> println l }}
}

