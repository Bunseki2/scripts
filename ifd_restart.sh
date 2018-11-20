#! /bin/bash

#PBS -N restart_533979513
cd $PBS_O_WORKDIR
module load  schrodinger/2013.2
ifd -HOST c4_1 -RESTART -NGLIDECPU 2 -NPRIMECPU 2 InducedFit_53379513_4L23.inp
