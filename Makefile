MEGAHIT=../megahit/megahit
QUAST=/u/t/quast-2.3/quast.py
SPADES=/u/t/foo2/SPAdes-3.1.1/bin/spades.py

all: quast_1m/report.txt quast_500k/report.txt quast_5m/report.txt

clean:
	-rm -fr megahit_1m megahit_5m megahit_500k

megahit_1m/final.contigs.fa: ecoli_ref-1m.fastq.gz
	${MEGAHIT} -m 1e9 -l 250 --k-max 81 -r ecoli_ref-1m.fastq.gz --cpu-only -o megahit_1m

megahit_5m/final.contigs.fa: ecoli_ref-5m.fastq.gz
	${MEGAHIT} -m 1e9 -l 250 --k-max 81 -r ecoli_ref-5m.fastq.gz --cpu-only -o megahit_5m

megahit_500k/final.contigs.fa: ecoli_ref-500k.fastq.gz
	${MEGAHIT} -m 1e9 -l 250 --k-max 81 -r ecoli_ref-500k.fastq.gz --cpu-only -o megahit_500k

quast_1m/report.txt: megahit_1m/final.contigs.fa
	${QUAST} -R ecoliMG1655.fa megahit_1m/final.contigs.fa -o quast_1m

quast_500k/report.txt: megahit_500k/final.contigs.fa
	${QUAST} -R ecoliMG1655.fa megahit_500k/final.contigs.fa -o quast_500k

quast_5m/report.txt: megahit_5m/final.contigs.fa
	${QUAST} -R ecoliMG1655.fa megahit_5m/final.contigs.fa -o quast_5m

spades_500k.out.d/contigs.fasta: ecoli_ref-500k.fastq.gz
	${SPADES} --pe1-12 ecoli_ref-500k.fastq.gz -o spades_500k.out.d

quast_spades_500k/report.txt: spades_500k.out.d/contigs.fasta
	${QUAST} -R ecoliMG1655.fa spades_500k.out.d/contigs.fasta -o quast_spades_500k
