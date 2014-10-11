Grab the data here:

     curl -O https://s3.amazonaws.com/public.ged.msu.edu/ecoli_ref-5m.fastq.gz

Subset it like so:

     gunzip -c ecoli_ref-5m.fastq.gz | head -4000000 | gzip -9c > ecoli_ref-1m.fastq.gz
     gunzip -c ecoli_ref-5m.fastq.gz | head -2000000 | gzip -9c > ecoli_ref-500k.fastq.gz

Grab the E. coli genome:

     curl -O https://s3.amazonaws.com/public.ged.msu.edu/ecoliMG1655.fa.gz
     gunzip ecoliMG1655.fa.gz

Install QUAST (http://bioinf.spbau.ru/quast) somewhere, edit Makefile appropriately.

Build MEGAHIT (https://github.com/voutcn/megahit/) somewhere, edit Makefile appropriately.

Install SPAdes (http://bioinf.spbau.ru/spades) somewhere, edit Makefile appropriately.

Run 'make all'.
