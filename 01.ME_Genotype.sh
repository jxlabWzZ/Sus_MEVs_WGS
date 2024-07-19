### call ME per sample
singularity exec  /home/guilu/software/MEGAnE.sif call_genotype \
-i /myinput/tmp/4410.sorted.markdup.bam \
-fa /myinput/susScr11.fa \
-mk /myinput/megane_kmer_set/susScr11.fa.mk \
-fadb /myinput/susScr11_blastdb \
-rep /myinput/Dfam_custom.rep \
-repout /myinput/susScr11.fa.out \
-repremove /myinput/non_ME_rep.txt \
-pA_ME /myinput/ME_with_pA.txt \
-mainchr /myinput/main_chrs.txt \
-sample_name 4410 \
-skip_unmapped \
-p 4 \
-outdir /myinput/tmp/4410/

###  join call MEI
singularity exec /home/guilu/software/MEGAnE.sif joint_calling \
-merge_mei \
-f dirlist.txt \
-fa /myref/susScr11.fa \
-rep /myref/Dfam_custom.rep \
-cohort_name TE809

### join call MEA
singularity exec /home/guilu/software/MEGAnE.sif joint_calling \
-merge_absent_me \
-f dirlist.txt \
-fa /myref/susScr11.fa \
-rep /myref/Dfam_custom.rep \
-cohort_name TE809

### merge MEI and MEA
singularity exec /home/guilu/software/MEGAnE.sif reshape_vcf \
-i /myref/tmp/step01/jointcall_out/TE809_MEI_jointcall.vcf \
-a /myref/tmp/step01/jointcall_out/TE809_MEA_jointcall.vcf \
-cohort_name TE809

### 
