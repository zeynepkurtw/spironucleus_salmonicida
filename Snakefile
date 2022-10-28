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
        #"output/HIN_aa_RMasker", # ddint work on proteome as expected
        #"output/HIN_assembly_RMasker",
        #"output/spiro_V2_RMasker",
        #"output/wb_RMasker",
        #"output/muris_RMasker",
        #"output/kbiala_RMasker",
        #"output/HIN_RMasker",
        #"output/HIN_TRF",
        #eggnog
        "output/3_eggnog/spiro.emapper.annotations",
        "output/3_eggnog/wb.emapper.annotations"



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
        "scripts/Rmasker.py"


rule tandem_repeat_finder:
    input:
        genome = "resource/{name}.fasta"
    output:
        directory("output/{name}_TRF")
    conda:
        "env/spironucleus.yaml"
    threads: 31
    script:
        "scripts/trf.py"

rule eggnog:
    input:
        genome="resource/3_eggnog/{genome}.faa"
    output:
        "output/3_eggnog/{genome}.emapper.annotations"
    threads: 31
    script:
        "scripts/eggnog.py"




    #History
"""
#I realised that I can't run RM on protein seq. 
rule repeatmasker_custom_db:
    input:
        genome = "resource/{name}.fasta",
        lib = "output/{name}_RModeler/{name}_db_lrr.fa"
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

#snakemake -c1 --use-conda --printshellcmds"""