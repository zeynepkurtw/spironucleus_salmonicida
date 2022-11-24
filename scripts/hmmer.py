from snakemake.shell import shell

#align = snakemake.input.align
fasta = snakemake.input.fasta
db= snakemake.input.db

hmm = snakemake.output[0]
out = snakemake.output[1]

#shell(f"""hmmbuild {hmm} {align}""")
shell(f"""hmmbuild {hmm} {fasta}""")
shell(f"""hmmcalibrate {hmm}""")
shell(f"""hmmsearch {hmm} {db}""")