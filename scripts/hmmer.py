from snakemake.shell import shell

align = snakemake.input.align
hmm = snakemake.output[0]

shell(f"""hmmbuild {hmm} {align}""")