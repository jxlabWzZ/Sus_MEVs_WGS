#!/bin/bash
cd $1
cat $2 $3 > allid.txt

p1=$2
p2=$3

singularity exec  vcftools.sif vcftools --vcf /mmtmp/me_all.vcf --keep allid.txt --maf 0.05 --max-missing 0.8 --recode --recode-INFO-all --out aa

singularity vcftools.sif vcftools --vcf /mmtmp/snp_all.vcf --keep allid.txt --maf 0.05 --max-missing 0.8 --recode --recode-INFO-all --out bb

singularity exec vcftools.sif vcftools --vcf aa.recode.vcf --weir-fst-pop ${p1} --weir-fst-pop ${p2} --out fst_${p1}_${p2}_me

singularity exec vcftools.sif vcftools --vcf bb.recode.vcf --weir-fst-pop ${p1} --weir-fst-pop ${p2} --fst-window-size 50000 --fst-window-step 25000 --out fst_${p1}_${p2}_snp50k


