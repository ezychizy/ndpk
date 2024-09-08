#!/bin/bash

# Create the new script file
output_file="parameter/d_rmsd.in"

echo "# RMSD and atomic fluctuation analysis" > $output_file

# Loop to generate trajin commands from 1 to 200
for i in $(seq 1 200); do
    echo "trajin c_nme1_prod_$i.crd" >> $output_file
done

# Append the RMSD and atomic fluctuation commands
cat <<EOL >> $output_file

rms first out ../../analysis/rmsd.nme1.A.dat :1-149@CA
atomicfluct out ../../analysis/bfct.nme1.A.dat :1-149@CA byres bfactor
rms first out ../../analysis/rmsd.nme1.B.dat :150-298@CA
atomicfluct out ../../analysis/bfct.nme1.B.dat :150-298@CA byres bfactor
rms first out ../../analysis/rmsd.nme1.C.dat :299-447@CA
atomicfluct out ../../analysis/bfct.nme1.C.dat :299-447@CA byres bfactor
rms first out ../../analysis/rmsd.nme1.D.dat :448-596@CA
atomicfluct out ../../analysis/bfct.nme1.D.dat :448-596@CA byres bfactor
rms first out ../../analysis/rmsd.nme1.E.dat :597-745@CA
atomicfluct out ../../analysis/bfct.nme1.E.dat :597-745@CA byres bfactor
rms first out ../../analysis/rmsd.nme1.F.dat :746-894@CA
atomicfluct out ../../analysis/bfct.nme1.F.dat :746-894@CA byres bfactor
rms first out ../../analysis/rmsd.nme1.com.dat :1-894@CA
atomicfluct out ../../analysis/bfct.nme1.com.dat :1-894@CA byres bfactor
EOL

# Commands to generate output data
cpptraj -p nme1.solv.prmtop -i parameter/d_rmsd.in