rule score_panther:
    input:
        proteome = proteome_dir + "transcriptome.pep"
        hmms = download_dir + "PANTHER11.0_hmmscoring/" ,
    output:
        tsv = panther_dir + "panther_scores.tsv"
    log:
        panther_dir + "panther_scores.log"
    benchmark:
        panther_dir + "panther_scores."
    threads:
        24
    shell:
        "export PERL5LIB=\"$PWD/src/pantherScore1.03/lib:$PERL5LIB\" ; "
        "perl src/pantherScore1.03/pantherScore.pl "
            "-l {input.hmms} "
            "-D B "
            "-V "
            "-c {threads} "
            "-i {input.proteome} "
            "-o {output.tsv} "
        "2> {log} 1>&2"
