## docker
w-docker(){
	docker run -it -v ~/.config/gcloud:/root/.config/gcloud  twokims/fastq-dump
}

java -jar ~/cromwell-87.jar run main.wdl -i input.json 
#gs://fc-secure-387f19e5-0d81-411b-9524-aec54db8e20a/fq
