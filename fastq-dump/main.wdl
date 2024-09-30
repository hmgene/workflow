version 1.0

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
		Array[File] i
		String o
	}
	command <<<
	gsutil -m mv ~{i} ~{o}/
	gsutil ls ~{o}/~{i}.fastq.gz > list.txt
	>>>
	output {
		Array[String] fastqs = read_lines("list.txt")
	}
}

workflow fqdp {
    input {
        String input_srr 
        String input_odir 
	String? input_options
    }
    # Call the dn task for each SRR from the input CSV
    call dn {
        input:
                srr = input_srr,
                odir = input_odir,
		opts = select_first([input_options," --split-3 "])
    }
    output {
	Array[String] fastq_files = dn.srrs
    }
}

