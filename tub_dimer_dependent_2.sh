#!/bin/bash


i=3
while [ $i -le 42 ]
do

sed 's/NUM1/'$i'/g' NPT_tubulin_36_restart_template2.conf > temp_1

let j=i+1
sed 's/NUM2/'$j'/g' temp_1 > temp_2

let k=i*500000
sed 's/NUM3/'$k'/g' temp_2 > NPT_tubulin_36_2_restart_$j.conf 


sed 's/NUM2/'$j'/g'  namd_ib_npt_restart_template2.sh >  namd_ib_npt_restart_2_$j.sh 
chmod +x namd_ib_npt_restart_2_$j.sh

m=`cat biobos_num`
qsub  -W depend=afterok:$m -v np=64 -l nodes=8:ib namd_ib_npt_restart_2_$j.sh &>biobos_num

let i=i+1


done
