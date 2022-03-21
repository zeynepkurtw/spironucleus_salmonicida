from snakemake.shell import shell

#input,output
query = snakemake.input.query
out = snakemake.output[0]



shell(f"""
BuildDatabase\
 -engine ncbi\
 -name $DATABASE $SEQFILE
""")

shell(f"""RepeatModeler\
 -database $DATABASE\
  -engine ncbi\
   -pa $NSLOTS
""")