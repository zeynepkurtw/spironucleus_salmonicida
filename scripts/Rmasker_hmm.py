from snakemake.shell import shell

genome = snakemake.input.genome
hmm = snakemake.input.hmm
out = snakemake.output
threads = snakemake.threads


#Search with hmm profiles
shell(f"RepeatMasker -pa {threads} -lib {hmm} -dir {out} -xsmall {genome} -s")