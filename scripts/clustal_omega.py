from snakemake.shell import shell

fasta = snakemake.input.fasta
out = snakemake.output

shell(f"""clustalo -i {fasta} -o {out} --outfmt=st""")
