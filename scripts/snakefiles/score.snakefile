rule score_panther:
    input:
        proteome = config["proteome"],
        hmms = download_dir + "PANTHER11.0/"
    output:
        tsv = panther_dir + "panther_scores.tsv"
    log:
        panther_dir + "panther_scores.log"
    benchmark:
        panther_dir + "panther_scores.json"
    params:
        chunk_size = 1000
    threads:
        24
    shell:
        "export PERL5LIB=\"$PWD/src/pantherScore1.03/lib:$PERL5LIB\" ; "
        "samtools faidx {input.proteome} ; "
        "cut -f 1 {input.proteome}.fai | "
        "parallel "
            "--pipe "
            "--max-replace-args {params.chunk_size} "
            "--jobs {threads} "
            "--cat "
            "--keep-order "
            "tmp1=\$\(mktemp\) \; "
            "cat {{}} \| xargs samtools faidx {input.proteome} \> \$tmp1 \; "
            "perl src/pantherScore1.03/pantherScore.pl "
                "-l {input.hmms} "
                "-D B "
                "-V "
                "-c 1 "
                "-i \$tmp1 \; "
            "rm \$tmp1 "
        "> {output.tsv} "
        "2> {log}"
