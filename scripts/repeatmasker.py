from snakemake.shell import shell

# input,output
genome = snakemake.input.genome
lib = snakemake.input.lib
out = snakemake.output
threads = snakemake.threads

shell(f"RepeatMasker -pa {threads} -lib {lib} -dir {out} -xsmall {genome}")
