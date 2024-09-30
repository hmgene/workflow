version 1.0

task gsutil_ls {
	input {
		String in
		File? ky # Input for the service account JSON key
	}

	command <<<
		set -e
		if [ "~{ky}" != "" ];then
			gcloud auth activate-service-account --key-file=~{ky}
		fi
		gsutil ls "~{in}" > res.txt
	>>>

	runtime {
		docker: "google/cloud-sdk"	# Specify the Docker image with Google Cloud SDK
		memory: "4 GB"
		cpu: "2"
	}

	output {
		Array[String] out= read_lines("res.txt")
	}
}


task b2f {
	input {
		String in
		Int? disk=200
		Int? mem=16
		Int? cpu=4
		Int? preemptible = 2
		File? ky 
	}
	command <<<
		if [ "~{ky}" != "" ];then
			gcloud auth activate-service-account --key-file="~{ky}"
		fi
		gsutil -m cp ~{in} input.bam
		bamtofastq input.bam out 
		o="~{in}"; o=${o%/*}/~{basename(in,".bam")};
		gsutil -m mv out/*/*.fastq.gz $o/
		gsutil ls $o/* > results.txt
		rm -r input.bam out
	>>>
	output {
		Array[String] out=read_lines("results.txt")
	}
	runtime {
		docker: "twokims/fastq-dump:latest"
		memory: "~{mem}G"
		disks: "local-disk ~{disk} HDD"
		cpu: "~{cpu}"
		preemptible: "~{preemptible}"
	}
}


workflow bm2fq {
	input {
		String in	# Path to the input directory
		String? out
		File? ky
	}
	call gsutil_ls{ input: in=in,ky=ky}
	scatter( i in gsutil_ls.out ){
		call b2f { input: in=i,ky=ky }
	}
	output {
		Array[String] final_outputs = flatten(b2f.out)
	}

}
