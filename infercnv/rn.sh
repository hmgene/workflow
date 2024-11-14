
for i in {66..93};do
    echo $i
    nextflow run main.nf -profile docker --input "gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/infercnv_out/SRR123545{}/"
    exit
done

