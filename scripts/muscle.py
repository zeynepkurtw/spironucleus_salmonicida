import snakemake
from snakemake.shell import shell

fasta = snakemake.input.fasta
out = snakemake.output[0]
log = snakemake.output[1]

shell(f"""muscle -align {fasta} -output {out} -log {log}""")

#muscle -log muscle_dna.log -align 1ped.fasta -output muscle_dna.fasta