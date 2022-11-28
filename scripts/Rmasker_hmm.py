from snakemake.shell import shell

genome = snakemake.input.genome
hmm = snakemake.input.hmm
out = snakemake.output
threads = snakemake.threads

#shell(f"RepeatMasker -pa {threads} -lib {lib} -dir {out} -xsmall {genome}")

#sensitive_search
shell(f"RepeatMasker -pa {threads} -lib {hmm} -dir {out} -xsmall {genome} -s")