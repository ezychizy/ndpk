#!/bin/bash

# Loop for reading data from 200 production output files
for i in $(seq 1 200); do
    echo "readdata ../c_prod_$i.out name MDOUT" >> parameter/d_total_energy.in
done

# Commands to write the energy data
echo "writedata ../../analysis/etot.dat MDOUT[Etot] time 0.00002" >> parameter/d_total_energy.in
echo "writedata ../../analysis/eptot.dat MDOUT[EPtot] time 0.00002" >> parameter/d_total_energy.in
echo "writedata ../../analysis/ektot.dat MDOUT[EKtot] time 0.00002" >> parameter/d_total_energy.in
echo "quit" >> parameter/d_total_energy.in

# Commands to generate output data
cpptraj -p nme1.solv.prmtop -i parameter/d_total_energy.in
