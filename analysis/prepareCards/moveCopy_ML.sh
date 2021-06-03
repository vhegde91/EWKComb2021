#!/bin/bash
# cd /afs/cern.ch/work/p/pmeiring/private/CMS/Combine/CMSSW_10_2_13/src
# cmsenv

INDIR=/afs/cern.ch/work/c/cericeci/public/forComb/
# OUTDIR=/afs/cern.ch/work/p/pmeiring/private/CMS/EWKComb2021/EOSmirror_test/
OUTDIR=/eos/cms/store/group/phys_susy/EWK_comb/
# COMBDIR=/afs/cern.ch/work/p/pmeiring/private/CMS/EWKComb2021/combdir/
COMBDIR=/eos/cms/store/group/phys_susy/EWK_comb/comb_trial_v1_May20_2021/
sigs=(TChiWZ_100_80 TChiWZ_125_85 TChiWZ_125_95 TChiWZ_125_105 TChiWZ_150_110)

# COPY SHAPES TO THE ANALYSIS DIR
mkdir -p ${OUTDIR}/ml/forComb/cards_2lss16_SRnewTChiWZ
mkdir -p ${OUTDIR}/ml/forComb/cards_2lss17_SRnewTChiWZ
mkdir -p ${OUTDIR}/ml/forComb/cards_2lss18_SRnewTChiWZ
cp ${INDIR}/cards_2lss16_SRnewTChiWZ/SS.input.root ${OUTDIR}/ml/forComb/cards_2lss16_SRnewTChiWZ/2lss16_SRnewTChiWZ.root
cp ${INDIR}/cards_2lss17_SRnewTChiWZ/SS.input.root ${OUTDIR}/ml/forComb/cards_2lss17_SRnewTChiWZ/2lss17_SRnewTChiWZ.root
cp ${INDIR}/cards_2lss18_SRnewTChiWZ/SS.input.root ${OUTDIR}/ml/forComb/cards_2lss18_SRnewTChiWZ/2lss18_SRnewTChiWZ.root

# COPY CARDS TO THE ANALYSIS DIR
for sig in "${sigs[@]}" ; do
	cp ${INDIR}/cards_2lss16_SRnewTChiWZ/SSsig_${sig}.card.txt ${OUTDIR}/ml/forComb/cards_2lss16_SRnewTChiWZ/
	cp ${INDIR}/cards_2lss17_SRnewTChiWZ/SSsig_${sig}.card.txt ${OUTDIR}/ml/forComb/cards_2lss17_SRnewTChiWZ/
	cp ${INDIR}/cards_2lss18_SRnewTChiWZ/SSsig_${sig}.card.txt ${OUTDIR}/ml/forComb/cards_2lss18_SRnewTChiWZ/
done

# COPY SHAPES AND CARDS TO THE ANLAYSIS DIR
mkdir -p ${OUTDIR}/ml/forComb/cards_3lA16_SRnewTChiWZ/shapes
mkdir -p ${OUTDIR}/ml/forComb/cards_3lA17_SRnewTChiWZ/shapes
mkdir -p ${OUTDIR}/ml/forComb/cards_3lA18_SRnewTChiWZ/shapes
for sig in "${sigs[@]}" ; do
	MNLSP="$(cut -d'_' -f2 <<<"$sig")"
	MLSP="$(cut -d'_' -f3 <<<"$sig")"
	cp ${INDIR}/cards_3lA16_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2016.root ${OUTDIR}/ml/forComb/cards_3lA16_SRnewTChiWZ/shapes/
	cp ${INDIR}/cards_3lA17_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2017.root ${OUTDIR}/ml/forComb/cards_3lA17_SRnewTChiWZ/shapes/
	# cp ${INDIR}/cards_3lA18_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_{MLSP}_2018.root ${OUTDIR}/ml/forComb/cards_3lA18_SRnewTChiWZ/shapes/
	
	cp ${INDIR}/cards_3lA16_SRnewTChiWZ/datacard_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2016.txt ${OUTDIR}/ml/forComb/cards_3lA16_SRnewTChiWZ/
	cp ${INDIR}/cards_3lA17_SRnewTChiWZ/datacard_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2017.txt ${OUTDIR}/ml/forComb/cards_3lA17_SRnewTChiWZ/
	# cp ${INDIR}/cards_3lA18_SRnewTChiWZ/datacard_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_{MLSP}_2018.txt ${OUTDIR}/ml/forComb/cards_3lA18_SRnewTChiWZ/

done


# MOVE THE SHAPES FILES TO COMB DIR, common/category_year.root
mkdir -p ${COMBDIR}/cards/ML/WZ/common
cp ${OUTDIR}/ml/forComb/cards_2lss16_SRnewTChiWZ/2lss16_SRnewTChiWZ.root ${COMBDIR}/cards/ML/WZ/common/
cp ${OUTDIR}/ml/forComb/cards_2lss17_SRnewTChiWZ/2lss17_SRnewTChiWZ.root ${COMBDIR}/cards/ML/WZ/common/
cp ${OUTDIR}/ml/forComb/cards_2lss18_SRnewTChiWZ/2lss18_SRnewTChiWZ.root ${COMBDIR}/cards/ML/WZ/common/

for sig in "${sigs[@]}"; do
	MNLSP="$(cut -d'_' -f2 <<<"$sig")"
	MLSP="$(cut -d'_' -f3 <<<"$sig")"
	cp ${OUTDIR}/ml/forComb/cards_3lA16_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2016.root ${COMBDIR}/cards/ML/WZ/common/3lA16_SRnewTChiWZ_${MNLSP}_${MLSP}.root
	cp ${OUTDIR}/ml/forComb/cards_3lA17_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2017.root ${COMBDIR}/cards/ML/WZ/common/3lA17_SRnewTChiWZ_${MNLSP}_${MLSP}.root
	# cp ${OUTDIR}/ml/forComb/cards_3lA18_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2018.root ${COMBDIR}/cards/ML/WZ/common/3lA18_SRnewTChiWZ_${MNLSP}_${MLSP}.root
done


# RENAME SHAPES FILES IN DATACARDS TO common/category_year.root (all shapes files are named identically, so we need to distinguish before combining)
for sig in "${sigs[@]}"; do
	MNLSP="$(cut -d'_' -f2 <<<"$sig")"
	MLSP="$(cut -d'_' -f3 <<<"$sig")"

	FILE=${OUTDIR}/ml/forComb/cards_2lss16_SRnewTChiWZ/SSsig_${sig}.card.txt
	sed -i "s+SS.input.root+common/2lss16_SRnewTChiWZ.root+g" $FILE
	FILE=${OUTDIR}/ml/forComb/cards_2lss17_SRnewTChiWZ/SSsig_${sig}.card.txt
	sed -i "s+SS.input.root+common/2lss17_SRnewTChiWZ.root+g" $FILE
	FILE=${OUTDIR}/ml/forComb/cards_2lss18_SRnewTChiWZ/SSsig_${sig}.card.txt
	sed -i "s+SS.input.root+common/2lss18_SRnewTChiWZ.root+g" $FILE		
done

# COMBINE THE CARDS
for sig in "${sigs[@]}"; do
	MNLSP="$(cut -d'_' -f2 <<<"$sig")"
	MLSP="$(cut -d'_' -f3 <<<"$sig")"

	combineCards.py \
	SS2l_2016=${OUTDIR}/ml/forComb/cards_2lss16_SRnewTChiWZ/SSsig_TChiWZ_${MNLSP}_${MLSP}.card.txt \
	SS2l_2017=${OUTDIR}/ml/forComb/cards_2lss17_SRnewTChiWZ/SSsig_TChiWZ_${MNLSP}_${MLSP}.card.txt \
	A3l_2016=${OUTDIR}/ml/forComb/cards_3lA16_SRnewTChiWZ/datacard_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2016.txt \
	A3l_2017=${OUTDIR}/ml/forComb/cards_3lA17_SRnewTChiWZ/datacard_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2017.txt \
	-S > ${COMBDIR}/cards/ML/WZ/card_TChiWZ_${MNLSP}_${MLSP}_all.txt
	# 2018_3lA=${OUTDIR}/ml/forComb/cards_3lA18_SRnewTChiWZ/datacard_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2018.txt \
	# SS2l_2018=${OUTDIR}/ml/forComb/cards_2lss18_SRnewTChiWZ/SSsig_TChiWZ_${MNLSP}_${MLSP}.card.txt \
done


# RENAME THE SHAPES FILES IN THE DATACARDS
for sig in "${sigs[@]}"; do
	MNLSP="$(cut -d'_' -f2 <<<"$sig")"
	MLSP="$(cut -d'_' -f3 <<<"$sig")"
	sed -i "s+${OUTDIR}/ml/forComb/cards_2lss16_SRnewTChiWZ/common/2lss16_SRnewTChiWZ.root+common/2lss16_SRnewTChiWZ.root+g" ${COMBDIR}/cards/ML/WZ/card_TChiWZ_${MNLSP}_${MLSP}_all.txt
	sed -i "s+${OUTDIR}/ml/forComb/cards_2lss17_SRnewTChiWZ/common/2lss17_SRnewTChiWZ.root+common/2lss17_SRnewTChiWZ.root+g" ${COMBDIR}/cards/ML/WZ/card_TChiWZ_${MNLSP}_${MLSP}_all.txt
	sed -i "s+${OUTDIR}/ml/forComb/cards_2lss18_SRnewTChiWZ/common/2lss18_SRnewTChiWZ.root+common/2lss18_SRnewTChiWZ.root+g" ${COMBDIR}/cards/ML/WZ/card_TChiWZ_${MNLSP}_${MLSP}_all.txt
	sed -i "s+${OUTDIR}/ml/forComb/cards_3lA16_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2016.root+common/3lA16_SRnewTChiWZ_${MNLSP}_${MLSP}.root+g" ${COMBDIR}/cards/ML/WZ/card_TChiWZ_${MNLSP}_${MLSP}_all.txt
	sed -i "s+${OUTDIR}/ml/forComb/cards_3lA17_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2017.root+common/3lA17_SRnewTChiWZ_${MNLSP}_${MLSP}.root+g" ${COMBDIR}/cards/ML/WZ/card_TChiWZ_${MNLSP}_${MLSP}_all.txt
	sed -i "s+${OUTDIR}/ml/forComb/cards_3lA18_SRnewTChiWZ/shapes/shapeFile_SR_new_TChiWZ_mChi2_${MNLSP}_mChi1_${MLSP}_2018.root+common/3lA18_SRnewTChiWZ_${MNLSP}_${MLSP}.root+g" ${COMBDIR}/cards/ML/WZ/card_TChiWZ_${MNLSP}_${MLSP}_all.txt
done



