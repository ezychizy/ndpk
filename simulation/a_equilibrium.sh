#!/bin/bash

# Step 1: Minimization
sander -O -i parameter/a_minimization_1.in -p nme1.solv.prmtop -c nme1.solv.inpcrd -r a_nme1_min_1.rst -o a_nme1_min_1.out -ref nme1.solv.inpcrd
sander -O -i parameter/a_minimization_2.in -p nme1.solv.prmtop -c a_nme1_min_1.rst -r a_nme1.min.2.rst -o a_nme1_min_2.out -ref a_nme1_min_1.rst

# Step 2: Equilibration - 3 iterations
for i in {1..3}; do
    prev_rst="b_nme1_equi_$((i-1)).rst"
    current_rst="b_nme1_equi_$i.rst"
    current_crd="b_nme1_equi_$i.crd"
    current_in="parameter/b_equilibrium_$i.in"
    current_out="b_nme1_equi_$i.out"

    if [ $i -eq 1 ]; then
        prev_rst="a_nme1_min_2.rst"
    fi

    sander -O -i $current_in -p nme1.solv.prmtop -c $prev_rst -r $current_rst -x $current_crd -o $current_out
done
