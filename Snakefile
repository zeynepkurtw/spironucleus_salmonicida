rule all:
    input:
        "2_genome_comp/output/spiro_V2_RMasker",
        "2_genome_comp/output/spiro_V1_RMasker",
        "2_genome_comp/output/spiro_V1_RMasker_P",
        "2_genome_comp/output/spiro_V2_RMasker_P"

    #"2_genome_comp/output/spiro_V1_feifei_RMasker"
    #"2_genome_comp/output/spiro_V1_feifei_RMasker_lib_dip"


rule build_database:
    input:
        genome="2_genome_comp/resource/{name}.fasta",
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
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/builddatabase.py"

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

rule repeatmasker_P:
    input:
        genome="2_genome_comp/resource/{name}.fasta",
        lib="2_genome_comp/output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("2_genome_comp/output/{name}_RMasker_P")
    params:
        species="Diplomonadida",
        gc=33,
        frag=600000,
        parallel=10
    conda:
        "env/spironucleus.yaml"
    threads: 31
    script:
        "scripts/repeatmasker.py"


rule repeatmasker_feifei:
    input:
        genome="2_genome_comp/resource/{name}.fasta",
        lib="2_genome_comp/output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("2_genome_comp/output/{name}_feifei_RMasker")
    params:
        feifei=True
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/repeatmasker.py"

rule repeatmasker_feifei_lib_dip:
    input:
        genome="2_genome_comp/resource/{name}.fasta",
    # lib="2_genome_comp/output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("2_genome_comp/output/{name}_feifei_RMasker_lib_dip")
    params:
        lib_dip=True
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/repeatmasker.py"
