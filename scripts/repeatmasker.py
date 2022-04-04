from snakemake.shell import shell

genome = snakemake.input.genome
lib = snakemake.input.lib
out = snakemake.output
threads = snakemake.threads

# shell(f"RepeatMasker -pa {threads} -lib {lib} -dir {out} -xsmall {genome}")

shell(f"RepeatMasker -frag 600000 -parallel 10 -gff -dir {out} -excln -gccalc -x {genome}")
