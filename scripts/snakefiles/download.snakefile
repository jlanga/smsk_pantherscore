rule download_wget_hmms:
    output:
        tarball= download_dir + "PANTHER11.0_hmmscoring.tgz"
    log:
        download_dir + "wget_hmms.log"
    benchmark:
        download_dir + "wget_hmms.json"
    params:
        url = config["urls"]["hmms"]
    shell:
        "wget "
            "--continue "
            "--output-document {output.tarball} "
            "2> {log} 1>&2"



rule download_untar_hmms:
    input:
        tarball= download_dir + "PANTHER11.0_hmmscoring.tgz"
    output:
        folder= download_dir + "PANTHER11.0_hmmscoring/"
    log:
        download_dir + "untar_hmms.log"
    benchmark:
        download_dir + "untar_hmms.json"
    shell:
        "tar "
            "--extract "
            "--verbose "
            "--file "
            "{input.tarball} "
        "2> {log} 1>&2"