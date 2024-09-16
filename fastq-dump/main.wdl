version 1.0

task dn {
    input {
        String srr
        String odir
    }

    command <<<
        # Run fasterq-dump to download the FASTQ files
        fasterq-dump ~{srr}

        # Check if both paired-end files were generated
        if [ -f ~{srr}_1.fastq ] && [ -f ~{srr}_2.fastq ]; then
            # Compress the FASTQ files
            gzip ~{srr}_1.fastq
            gzip ~{srr}_2.fastq

            # Move compressed files to the output directory
            gsutil -m mv ~{srr}_1.fastq.gz ~{odir}/
            gsutil -m mv ~{srr}_2.fastq.gz ~{odir}/
        else
            # Log error and exit if the paired files are not found
            echo "Paired-end files not found" >&2
            exit 1
        fi
    >>>

    output {
        String srr1 = "~{odir}/~{srr}_1.fastq.gz"
        String srr2 = "~{odir}/~{srr}_2.fastq.gz"
    }
    runtime {
        docker: "twokims/fastq-dump"
        cpu: 4                     
        memory: "16 GB"             
        disks: "local-disk 100 GB"  
    }
}

workflow fqdp {
    input {
        String srr 
        String odir 
    }
    # Call the dn task for each SRR from the input CSV
    call dn {
        input:
                srr = srr,
                odir = odir
    }
    output {
        String srr1 = dn.srr1
        String srr2 = dn.srr2
    }
}

