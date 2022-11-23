from snakemake.shell import shell

fasta = snakemake.input.fasta
out = snakemake.output
log = snakemake.output

shell(f"""muscle -align {fasta} -output {out} -log {log}""")

#muscle -log muscle_dna.log -align 1ped.fasta -output muscle_dna.fasta