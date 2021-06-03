#!/bin/bash
years=(2016 2017 2018
)

regs=(2los_cr_dy_low 2los_cr_dy_med 2los_cr_ss_med 2los_cr_tt_low 2los_cr_tt_med 2los_sr_high 2los_sr_low 2los_sr_med 2los_sr_ultra 3l_cr_wz_low 3l_cr_wz_med 3l_sr_low 3l_sr_med)

COMBDIR=/eos/cms/store/group/phys_susy/EWK_comb/

sigs=(TChiWZ_100_80 TChiWZ_125_85 TChiWZ_125_95 TChiWZ_125_105 TChiWZ_150_110)


for sig in "${sigs[@]}"; do
    cp ${COMBDIR}/sos/210319_nominal_merged/cards/${sig}/card_${sig}_all.txt ${COMBDIR}/comb_trial_v1_May20_2021/cards/SOS/WZ/card_${sig}_all.txt
    for year in "${years[@]}" ; do
        for reg in "${regs[@]}" ; do
            cp ${COMBDIR}/sos/210319_nominal_merged/bare/$year/$reg/${sig}/sos_$reg.root ${COMBDIR}/comb_trial_v1_May20_2021/cards/SOS/WZ/common/$reg"_"$year"_${sig}.root"
            sed -i "s+/afs/cern.ch/work/p/pmeiring/private/CMS/datacards_SOS/210319_nominal_merged/bare/${year}/${reg}/${sig}/sos_${reg}.root+common/${reg}_${year}_${sig}.root+g" ${COMBDIR}/comb_trial_v1_May20_2021/cards/SOS/WZ/card_${sig}_all.txt
        done
    done
done

