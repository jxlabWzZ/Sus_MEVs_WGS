### FeatureCounts for gene expression
singularity exec /home/guilu/software/star_2.7.9a_subread.simg  featureCounts -T 20 -s 2 -t exon -g gene_id -Q 20 -C -p -D 1000 \
--fracOverlap 0.9 --fraction -O -a Sus_scrofa.Sscrofa11.1.110.gtf \
-o ${id}_uniqmap.gene.txt ${id}.sorted.markdup.bam

### leafcutter for Alternative Splicing
echo startleafcutter
export PATH=/home/software/leafcutter/scripts/:$PATH
bam2junc.sh ${ID}.sorted.bam ${ID}.junc
cp ${ID}.junc ${output}

### eQTL / sQTL
singularity exec fastqtl.sif  fastQTL --vcf TE_maf0.05_miss0.9.vcf.gz --bed t7_norm_chr.bed.gz --cov liver_p20_cov2.txt --normal --out ./02.result_Peer20_maf0.05_p1000/eqtl_perm_${i} --region ${i} --permute 1000

### to get Heritiability
for i in {1..18} X; do awk -v i=$i '{if($2==i) print $1}' ../ok4169_boforoni.txt > ids${i}.txt; done
#chr=18
for i in `cat ids${chr}.txt`
do
awk -v i=$i '{if($1==i) print $8}' 03.eQTL/ok4169_boforoni.txt
 > idTE_${i}.txt
awk -v i=$i '{if($1==i) print $0}' 03.eQTL/00.snv_te/nominal_s
v_${chr} | grep -v "TE" | sed 's/ /\t/g' | awk '{if($12<=0.01) print $0}' | sort -gk12 | head -n 1000 | cut -f 8 > idSNP_${i}.txt
singularity exec /home/guilu/software/087.vcftools.sif vcftools --gzvcf ME266ok.vcf.gz --snps idTE_${i}.txt --recode --recode-INFO-all --out idTE_${i}
singularity exec -B  /home/guilu/software/087.vcftools.sif vcftools --gzvcf /mysnp/SNP_SV${chr}ok.vcf.gz --snps idSNP_${i}.txt --recode --recode-INFO-all --out idSNP_${i}
grep -v -E "DEL|INS|INV|DUP" idSNP_${i}.recode.vcf > idSNP_${i}.recode2.vcf
plink2 --vcf idTE_${i}.recode.vcf --make-bed --out idTE_${i}
plink2 --vcf idSNP_${i}.recode2.vcf --make-bed --out idSNP_${i}
gcta64  --bfile idTE_${i}   --make-grm  --out TE_${i}
gcta64  --bfile idSNP_${i}   --make-grm  --out SNP_${i}
echo "SNP_${i}" > ${i}_mgrm.txt
echo "TE_${i}" >> ${i}_mgrm.txt
less -S ../t8.txt.gz | awk -v i=$i '{if($4==i || $4=="pid") print $0}' |cut -f 7- | datamash transpose | awk '{print "0\t"$1"\t"$2}' > ${i}.phen
gcta64 --reml --mgrm ${i}_mgrm.txt --pheno ${i}.phen --out test_${i}_he.txt
done

