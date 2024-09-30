## docker
w-docker(){
	docker run -it -v ~/.config/gcloud:/root/.config/gcloud  twokims/fastq-dump
}

#java -jar ~/cromwell-87.jar run main.wdl -i input.json 
#java -jar ~/cromwell-87.jar run main.wdl -i input_gsbucket.json 
#gs://fc-secure-387f19e5-0d81-411b-9524-aec54db8e20a/fq
java -jar ~/cromwell-87.jar run main.wdl -i <( echo '{
 "fqdp.input_bam":"Foreman_753_03142019_1_possorted_genome_bam.bam",
 "fqdp.input_odir":"out",
 "fqdp.input_bucket":"gs://millerlab-bucket/hyunmin"
}' ) 
