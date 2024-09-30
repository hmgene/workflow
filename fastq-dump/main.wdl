version 1.0

task bm2fq {
	input { 
		File bam_file
		String odir
	}
	String fn = basename(bam_file, ".bam")
	command <<<
		echo "~{bam_file} =>  ~{odir}/~{fn}/~{fn}.*.fastq.gz"
		bamtofastq ~{bam_file}  ~{odir} 
	>>>
	output { 
		Array[File] fqs= glob("~{odir}/~{fn}/~{fn}.*.fastq.gz")
	}
    runtime {
        docker: "twokims/fastq-dump:latest"
        cpu: "2"
        memory: "4 GB"
        disks: "local-disk 200 HDD"
    }
}

task dn {
    input {
        String srr
        String odir
	String opts
    }

    command <<<
	# Run fasterq-dump to download the FASTQ files
	echo ~{odir}
	fastq-dump ~{ opts } --gzip  ~{srr}
	#mkdir -p ~{odir}
	#mv ~{srr}*.fastq.gz ~{odir}
    >>>
    output {
 	# Array[String] srrs = glob("~{odir}/~{srr}*.fastq.gz")
    }
    runtime {
        docker: "twokims/fastq-dump:latest"
        cpu: "4"
        memory: "4 GB"
        disks: "local-disk 200 HDD"
    }
}

task up {
	input {
		String ifile
		String obucket
	}

	command <<<
		gsutil cp ${ifile} ${obucket}
	>>>

	output {
		String ofile = obucket+"/"+basename(ifile)
	}
}
workflow fqdp {
    input {
        File input_bam
	String input_odir
	String input_bucket
    }
    # Call the dn task for each SRR from the input CSV
    call bm2fq {
        input:
                bam_file = input_bam,
		odir = input_odir
    }
    scatter(file in bm2fq.fqs ){ 
	call up {
		input:
			ifile = file,
			obucket = input_bucket
	}
    }
    output {
	Array[String] fastq_files = bm2fq.fqs
    }
}

