from snakemake.shell import shell

align = snakemake.input.align
db= snakemake.input.db

hmm = snakemake.output.hmm
out = snakemake.output

shell(f"""hmmbuild {hmm} {align}""")
shell(f"""hmmcalibrate {hmm}""")
shell(f"""hmmsearch {hmm} {db}""")