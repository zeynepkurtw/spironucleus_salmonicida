from snakemake.shell import shell

align = snakemake.input.align[0]
db= snakemake.input.db[1]

hmm = snakemake.output[0]
out = snakemake.output[1]

shell(f"""hmmbuild {hmm} {align}""")
shell(f"""hmmcalibrate {hmm}""")
shell(f"""hmmsearch {hmm} {db}""")