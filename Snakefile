rule all:
    input:
        #Spiro new genome paper
        #"output/spiro_V2_RMasker",
        #"output/spiro_V1_RMasker",
        #"output/spiro_V1_RMasker_P",
        #"output/spiro_V2_RMasker_P"
        #"output/spiro_V1_feifei_RMasker"
        #"output/spiro_V1_feifei_RMasker_lib_dip"
        #TE
        "/output/HIN_RMasker",
        "/output/spiro_RMasker"
        #"/output/wb_RMasker",
        #"/output/muris_RMasker",
        #"/output/kbiala_RMasker",


rule build_database:
    input:
        genome="resource/{name}.fasta",
    output:
        multiext("output/{name}_RModeler/{name}_db",
            ".nhr",
            ".nnd",
            ".nin",
            ".nni",
            ".nog",
            ".nsq",
            ".translation")
    params:
        db_name="output/{name}_RModeler/{name}_db"
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/builddatabase.py"

rule repeatmodeler:
    input:
        genome="resource/{name}.fasta",
        db="output/{name}_RModeler/{name}_db.nhr"
    output:
        "output/{name}_RModeler/{name}_db-families.fa"
    params:
        db_name="output/{name}_RModeler/{name}_db"
    conda:
        "env/spironucleus.yaml"
    threads: 31
    script:
        "scripts/repeatmodeler.py"

rule repeatmasker:
    input:
        genome="resource/{name}.fasta",
        lib="output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("output/{name}_RMasker")
    conda:
        "env/spironucleus.yaml"
    threads: 31
    script:
        "scripts/repeatmasker.py"

rule repeatmasker_P:
    input:
        "resource/{name}.fasta",
        "output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("output/{name}_RMasker_P")
    conda:
        "env/spironucleus.yaml"
    threads: 31
    shell:
        "RepeatMasker -species Diplomonadida -gc 33 -x -poly -frag 600000 -parallel 10 -gff -dir {output} -excln -gccalc {input[0]} -lib {input[1]}"


rule repeatmasker_feifei:
    input:
        genome="resource/{name}.fasta",
        lib="output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("output/{name}_feifei_RMasker")
    params:
        feifei=True
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/repeatmasker.py"

rule repeatmasker_feifei_lib_dip:
    input:
        genome="resource/{name}.fasta",
    # lib="output/{name}_RModeler/{name}_db-families.fa"
    output:
        directory("output/{name}_feifei_RMasker_lib_dip")
    params:
        lib_dip=True
    conda:
        "env/spironucleus.yaml"
    script:
        "scripts/repeatmasker.py"
