
rule all:
    input:
        "2_genome_comp/output/spiro_V2_RMasker",
        "2_genome_comp/output/spiro_V1_RMasker"

rule run_repeatmodeller:
    input:
        genome="2_genome_comp/resource/{name}.fasta"
    output:
        "2_genome_comp/output/{name}_RModeler/{name}_db-families.fa"
    conda:
        "env/spironucleus.yaml"
    threads: 31
    script:
        "scripts/repeatmodeler.py"

rule run_repeatmasker:
    input:
        genome="2_genome_comp/resource/{name}.fasta",
        lib="2_genome_comp/output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("2_genome_comp/output/{name}_RMasker")
    conda:
        "env/spironucleus.yaml"
    threads: 31
    script:
        "scripts/repeatmasker.py"