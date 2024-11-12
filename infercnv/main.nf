nextflow.enable.dsl=2
//params.input = 'gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/infercnv_out/SRR12354564/'


process list_gcs_files {
    container = "twokims/infercnv-x"
    memory '8 GB'
    input:
    val i

    output:
    path "results.txt"  // Output the results to a file

    script:
    gb=(i =~ /gs:\/\/([^\/]*)/)[0][1]
    sb=i.replaceFirst("gs://[^/]+/","")
    sb = sb.replaceFirst(/\/$/, "")
    """
    #export GOOGLE_APPLICATION_CREDENTIALS=/root/service-account-key.json
    #gcloud auth activate-service-account --key-file=/root/service-account-key.json
    mkdir -p /mnt/data
    gcsfuse --implicit-dirs --only-dir ${sb} ${gb} /mnt/data
    R --no-save -e 'library(infercnv);add_to_seurat(infercnv_output_path="/mnt/data");' > results.txt
    """
}

workflow {
    list_gcs_files(params.input)
    res = list_gcs_files.out
    res.each { f -> f.text.eachLine {  l -> println l }}
}

