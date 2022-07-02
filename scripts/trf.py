from snakemake.shell import shell

genome = snakemake.input.genome
out = snakemake.output

shell(f"trf {genome} 2 5 7 80 10 50 2000 -l 10 > {out}")
