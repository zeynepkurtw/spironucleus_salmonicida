from snakemake.shell import shell

genome = snakemake.input.genome
hmm = snakemake.input.hmm
out = snakemake.output
threads = snakemake.threads


#Search with hmm profiles
shell(f"RepeatMasker -s -engine hmmer -lib {hmm} {genome} -xsmall -dir {out} -pa {threads}")