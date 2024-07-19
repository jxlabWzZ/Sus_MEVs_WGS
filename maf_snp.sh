for i in {1..18} X
do
grep -v "POS" ../../13.MESNP/ff_${i}.frq | sed 's/:/\t/g' | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | cut -f 1-3 | awk '{print "chr"$2":"$3":SG\t"$1}' > snp_${i}_maf.txt
done

cat snp_*_maf.txt > snp.maf.txt

awk 'NR==FNR{a[$1]=$0;next}NR>FNR{if($1 in a)print $0"\t"a[$1]}' snp.maf.txt synonymous_snp.ids > synonymous.txt

awk 'NR==FNR{a[$1]=$0;next}NR>FNR{if($1 in a)print $0"\t"a[$1]}' snp.maf.txt missense_snp.ids > missense.txt

###synonymous.txt
awk '{if($3<=0.05 && $3>0) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.1 && $3>0.05) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.15 && $3>0.1) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.2 && $3>0.15) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.25 && $3>0.2) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.3 && $3>0.25) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.35 && $3>0.3) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.4 && $3>0.35) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.45 && $3>0.4) print $0}' synonymous.txt | wc -l
awk '{if($3<=0.5 && $3>0.45) print $0}' synonymous.txt | wc -l

echo "##########"

awk '{if($3<=0.05 && $3>0) print $0}' missense.txt | wc -l
awk '{if($3<=0.1 && $3>0.05) print $0}' missense.txt | wc -l
awk '{if($3<=0.15 && $3>0.1) print $0}' missense.txt | wc -l
awk '{if($3<=0.2 && $3>0.15) print $0}' missense.txt | wc -l
awk '{if($3<=0.25 && $3>0.2) print $0}' missense.txt | wc -l
awk '{if($3<=0.3 && $3>0.25) print $0}' missense.txt | wc -l
awk '{if($3<=0.35 && $3>0.3) print $0}' missense.txt | wc -l
awk '{if($3<=0.4 && $3>0.35) print $0}' missense.txt | wc -l
awk '{if($3<=0.45 && $3>0.4) print $0}' missense.txt | wc -l
awk '{if($3<=0.5 && $3>0.45) print $0}' missense.txt | wc -l


