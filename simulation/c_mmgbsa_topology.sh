#!/bin/bash

# Generate topology files
echo "trajin c_nme1_prod_200.crd" > parameter/d_mmgbsa_lig.in
echo "strip !(:1-149) outprefix nme1.lig nobox" >> parameter/d_mmgbsa_lig.in

echo "trajin c_nme1_prod_200.crd" > parameter/d_mmgbsa_rec.in
echo "strip !(:150-894) outprefix nme1.rec nobox" >> parameter/d_mmgbsa_rec.in

echo "trajin c_nme1_prod_200.crd" > parameter/d_mmgbsa_com.in
echo "strip !(:1-894) outprefix nme1.com nobox" >> parameter/d_mmgbsa_com.in

cpptraj -p ../1_prep/nme1/nme1.solv.prmtop <parameter/d_mmgbsa_lig.in> parameter/d_mmgbsa.lig.out
cpptraj -p ../1_prep/nme1/nme1.solv.prmtop <parameter/d_mmgbsa_rec.in> parameter/d_mmgbsa.rec.out
cpptraj -p ../1_prep/nme1/nme1.solv.prmtop <parameter/d_mmgbsa_com.in> parameter/d_mmgbsa.com.out

mv nme1.lig.nme1.solv.prmtop nme1.lig.dry.prmtop
mv nme1.rec.nme1.solv.prmtop nme1.rec.dry.prmtop
mv nme1.com.nme1.solv.prmtop nme1.com.dry.prmtop

cp nme1.lig.dry.prmtop ../analysis
cp nme1.rec.dry.prmtop ../analysis
cp nme1.com.dry.prmtop ../analysis