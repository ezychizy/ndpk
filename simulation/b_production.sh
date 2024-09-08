#!/bin/bash

# Number of iterations
num_iterations=200

# Loop from 1 to $num_iterations
for i in $(seq 1 $num_iterations); do
    if [ $i -eq 1 ]; then
        prev_rst="b_nme1_equi_3.rst"
        ref_rst="b_nme1_equi_3.rst"
    else
        prev_rst="c_nme1_prod_$((i-1)).rst"
        ref_rst="c_nme1_prod_$((i-1)).rst"
    fi
    
    current_out="c_prod_$i.out"
    current_rst="c_nme1_prod_$i.rst"
    current_crd="c_nme1_prod_$i.crd"

    pmemd.cuda -O -i parameter/c_production_1.in -o $current_out -p nme1.solv.prmtop -c $prev_rst -r $current_rst -x $current_crd -ref $ref_rst
done
