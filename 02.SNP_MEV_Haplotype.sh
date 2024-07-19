### to extract ME
for i in {1..18} X
do
plink2 --threads 6 --memory 30000 --vcf /myinput/v0_tmp/step01/jointcall_out/TE809_biallelic.vcf --keep k747.id  --make-pgen --min-alleles 2 --max-alleles 2 --mac 5 --maf 0.01 --geno 0.2 --chr ${i} --indiv-sort natural --vcf-half-call missing --export vcf bgz -
-sort-vars --out ME${i}
done

### to extract SNP
plink2 --threads 16 --memory 40000 \
--vcf /myinput/raw_snp_chr${n}.vcf.gz \
--keep k747.id \
--make-pgen \
--max-alleles 2 \
--maf 0.05 \
--geno 0.05 \
--chr chr${n} \
--indiv-sort natural \
--exclude bed0 ${exclude} \
--export vcf bgz \
--out SNP${n}

less -S SNP${n}.vcf.gz | awk '{if($7=="PASS" && $5!~"," && length($4)==1 && length($5)==1 || $1~"#") print $0}' | grep -v -E "PASS_AC=0;|AAScore=0.[0-8]|AF=0;| AF=1;|;AC=[0-4];" > SNP${n}ok.vcf
bgzip SNP${n}ok.vcf

### merge SNP and MEVs
zcat SNP${n}ok.vcf.gz | awk 'BEGIN{OFS="\t"}{if($1!~"#") {$6="."; $8="."}; print $0}' | pigz -c > _SNP_ME${n}.vcf.gz
zcat ME${n}.vcf.gz | grep -v '#' | pigz -c >> _SNP_ME${n}.vcf.gz
zcat _SNP_ME${n}.vcf.gz | pigz -c > SNP_ME${n}.vcf.gz
rm _SNP_ME${n}.vcf.gz

plink2 --threads 16 --memory 40000 \
--vcf SNP_ME${n}.vcf.gz \
--make-pgen \
--sort-vars \
--vcf-half-call missing \
--out SNPok_ME${n}

plink2 --threads 16 --memory 40000 \
--pfile SNPok_ME${n} \
--export vcf bgz \
--out SNP_ME${n}_sorted
tabix SNP_ME${n}_sorted.vcf.gz

bcftools view -c 0 -o SNP_ME${n}_sortedok.vcf SNP_ME${n}_sorted.vcf.gz
bgzip -@ 10 SNP_ME${n}_sortedok.vcf
tabix -p vcf SNP_ME${n}_sortedok.vcf.gz

### shapeit5 for phasing
singularity exec /home/guilu/software/shapeit5.simg phase_common_static --input SNP_ME${n}_sortedok.vcf.gz --region ${n} --thread 16 --output pp${n}

