import snakemake
from snakemake.shell import shell

input = snakemake.input
out = snakemake.output
log = snakemake.output

shell(f"""muscle -align {input} -output {out} -log {log}""")

#muscle -log muscle_dna.log -align 1ped.fasta -output muscle_dna.fasta