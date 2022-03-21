
rule all:
    input:
        directory("2_genome_comp/output/spiro_V1_RMasker"),
        #directory("output/spiro_V1_RModeler")

rule run_repeatmodeller:
    input:
        "resource/spiro_V1.fasta"
    output:
        directory("2_genome_comp/output/spiro_V1_RModeler")
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/repeatmodeler.py"

rule run_repeatmasker:
    input:
        genome="2_genome_comp/resource/spiro_V1.fasta",
        lib="2_genome_comp/spiro_V1_RModeler/spiroV1_db-families.fa"
    output:
        directory("2_genome_comp/output/spiro_V1_RMasker")
    conda:
        "env/spironucleus.yaml"
    threads: 30
    script:
        "scripts/repeatmasker.py"