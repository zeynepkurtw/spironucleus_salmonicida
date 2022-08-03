from snakemake.shell import shell

genome = snakemake.input.genome
out = snakemake.output
threads = snakemake.threads


shell(f"python /emapper.py -i {genome} --output {out} -m diamond --data_dir eggnog")