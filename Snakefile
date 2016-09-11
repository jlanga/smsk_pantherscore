shell.prefix("set -euo pipefail;")
configfile: "config.yaml"


snakefiles = "scripts/snakefiles/"

include: snakefiles + "folders.snakefile"
include: snakefiles + "download.snakefile"
include: snakefiles + "score.snakefile"


rule all:
    input:
         panther_dir + "panther_scores.tsv"
