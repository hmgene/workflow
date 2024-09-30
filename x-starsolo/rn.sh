
#in=gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354564/Foreman_753_03142019_1_possorted_genome_bam
input=(
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354564/Foreman_753_03142019_1_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354565/Foreman_1_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354566/1_831_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354567/Foreman_2_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354568/Foreman_898_03142019_2_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354569/1_925_010819_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354570/2_934_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354571/1_943_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354572/2_945_010819_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354573/Foreman_966_03142019_3_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354574/Foreman_3_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354575/Foreman_1028_03142019_4_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354576/Foreman_1066_03142019_5_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354577/Foreman_4_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354578/Foreman_1125_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354579/Foreman_1128_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354580/3_1130_010819_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354581/Foreman_1155_03142019_6_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354582/4_1167_010819_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354583/Foreman_1177_03142019_7_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354584/1195_3_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354585/1224_4_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354586/1235_5_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354587/1238_5_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354588/1325_7_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354589/4_1355_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354590/1397_6_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354591/1416_7_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354592/1433_8_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354593/966_2_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354594/2_MP_luc_GFP_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354595/3_MG_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354596/MED9_1_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354597/MED11_2_possorted_genome_bam/
gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/bam_orig/SRR12354598/MED21_3_possorted_genome_bam/
)

output=input-starsolo.tsv
echo "Sample Reference Flowcells Assay" | tr " " "\t" > $output
for i in ${input[@]};do
	s=${i##*/bam_orig/};s=${s%%/*}
	echo "$s GRCh38-2020-A $i tenX_v3" | tr " " "\t"  >> $output
done

head $output

o_input=gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/starsolo/${output##*/}
o_output=gs://millerlab-bucket/hyunmin/medulloblastoma/riemondy_2022/starsolo

gsutil cp $output $o_output/

echo "put this in WDL
input:
$o_input
output:
$o_output
"


