from snakemake.shell import shell

#input
db = snakemake.input.db
genome=snakemake.input.genome
threads = snakemake.threads


shell(f"""BuildDatabase -engine ncbi name {db} {genome} """)

shell(f"""RepeatModeler -database {db} -engine ncbi -pa {threads} """)