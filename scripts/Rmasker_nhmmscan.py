from snakemake.shell import shell

genome = snakemake.input.genome
hmm = snakemake.input.hmm
out = snakemake.output
threads = snakemake.threads


#Snsitive search with hmm profiles
shell(f"RepeatMasker -lib {hmm} -hmmer {genome} -s -pa {threads} xsmall -dir {out}")
