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
	gsutil -m mv ~{srr}*.fastq.gz ~{odir}/
	gsutil ls ~{odir}/~{srr}*.fastq.gz > list.txt
    >>>
    output {
 	# Array[String] srrs = glob("~{odir}/~{srr}*.fastq.gz")
	Array[String] srrs = read_lines("list.txt")
    }
    runtime {
        docker: "twokims/fastq-dump:latest"
        cpu: "4"
        memory: "4 GB"
        disks: "local-disk 200 HDD"
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

