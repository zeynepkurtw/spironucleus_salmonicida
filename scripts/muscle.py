from snakemake.shell import shell

fasta = snakemake.input.fasta
out = snakemake.output
log = snakemake.output

shell(f"""muscle -align {fasta} -output {out} -log {log}""")