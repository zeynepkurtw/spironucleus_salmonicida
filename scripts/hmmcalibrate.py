from snakemake.shell import shell

hmm = snakemake.input.hmm
out = snakemake.output


#Search with hmm profiles
shell(f"hmm2calibrate --fdr 0.01 {hmm} > {out}")