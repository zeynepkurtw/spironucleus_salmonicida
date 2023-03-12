from snakemake.shell import shell

hmm = snakemake.input.hmm
out = snakemake.output


#Search with hmm profiles
shell(f"hmmcalibrate2 -f 0.01 {hmm} > {out}")