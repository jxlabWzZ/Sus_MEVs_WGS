#!/bin/bash

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.05) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.1 && $1>0.05) print $0}' | wc -l


sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.15 && $1>0.1) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.2 && $1>0.15) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.25 && $1>0.2) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.3 && $1>0.25) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.35 && $1>0.3) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.4 && $1>0.35) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.45 && $1>0.4) print $0}' | wc -l

sed 's/:/\t/g;s/<INS\tME>/<INS:ME>/g' ff.frq | awk '{if($6<=$8){print $6"\t"$0} else print $8"\t"$0}' | awk '{if($1<=0.5 && $1>0.45) print $0}' | wc -l
