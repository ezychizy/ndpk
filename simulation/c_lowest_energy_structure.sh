#!/bin/bash

echo "trajin c_nme1.prod.200.crd" > d_lowest_energy_structure.in
echo "strip :WAT,Na+,Cl-" >> d_lowest_energy_structure.in
echo "average ../analysis/3.nme1_lowest_energy_structure.pdb pdb nobox 50000 50000 1" >> d_lowest_energy_structure.in
cpptraj -p nme1.solv.prmtop -i d_lowest_energy_structure.in

