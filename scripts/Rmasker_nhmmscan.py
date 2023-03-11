from snakemake.shell import shell

genome = snakemake.input.genome
hmm = snakemake.input.hmm
out = snakemake.output
threads = snakemake.threads


#Snsitive search with hmm profiles
shell(f"RepeatMasker -engine hmmer -lib {hmm} -a {genome} -s -pa {threads} -xsmall -dir {out}")
