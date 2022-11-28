from snakemake.shell import shell

#align = snakemake.input.align
align = snakemake.input.align
#db= snakemake.input.db

hmm = snakemake.output[0]
#out = snakemake.output[1]

#shell(f"""hmmbuild {hmm} {align}""")
shell(f"""hmmbuild {hmm} {align}""")
#shell(f"""hmmcalibrate {hmm}""")
#shell(f"""hmmsearch {hmm} {db}""")