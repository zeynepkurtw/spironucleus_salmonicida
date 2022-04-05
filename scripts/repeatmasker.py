from snakemake.shell import shell

genome = snakemake.input.genome
lib = snakemake.input.lib
out = snakemake.output
feifei = snakemake.params.get('feifei', False)
lib_dip = snakemake.params.get('lib_dip', False)

threads = snakemake.threads

if feifei:
    shell(f"RepeatMasker -frag 600000 -parallel 10 -gff -dir {out} -excln -gccalc -x {genome}")
elif lib_dip:
    shell(
        f"RepeatMasker -species Diplomonadida -gc 33 -x -poly -frag 600000 -parallel 10 -gff -dir {out} -excln -gccalc -x {genome}")
else:
    shell(f"RepeatMasker -pa {threads} -lib {lib} -dir {out} -xsmall {genome}")
