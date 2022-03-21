rule all:
    input:
        "2_genome_comp/output/spiro_V2_RMasker",
        "2_genome_comp/output/spiro_V1_RMasker"

rule build_database:
    input:
        "2_genome_comp/resource/{name}.fasta",
    output:
        multiext("2_genome_comp/output/{name}_RModeler/{name}_db",
            ".nhr",
            ".nnd",
            ".nin",
            ".nni",
            ".nog",
            ".nsq",
            ".translation")
    params:
        db_name="2_genome_comp/output/{name}_RModeler/{name}_db"

rule repeatmodeler:
    input:
        genome="2_genome_comp/resource/{name}.fasta",
        db="2_genome_comp/output/{name}_RModeler/{name}_db.nhr"
    output:
        "2_genome_comp/output/{name}_RModeler/{name}_db-families.fa"
    params:
        db_name="2_genome_comp/output/{name}_RModeler/{name}_db"
    conda:
        "env/spironucleus.yaml"
    threads: 31
    script:
        "scripts/repeatmodeler.py"

rule repeatmasker:
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
