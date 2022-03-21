configfile: "config.yaml"

rule all:
    output:
        directory("output/spiro_V1_RMasker"),
        directory("output/spiro_V1_RModeler")


rule run_repeatmodeller:
    input:
        "resources/spiro_V1.fasta"
    output:
        directory("output/spiro_V1_RModeler")
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/repeatmodeler.py"

rule run_repeatmasker:
    input:
        genome="resources/spiro_V1.fasta",
        lib="spiro_V1_RModeler/spiroV1_db-families.fa"
    output:
        directory("output/spiro_V1_RMasker")
    conda:
        "env/spironucleus.yaml"
    threads: 30
    script:
        "scripts/repeatmasker.py"
