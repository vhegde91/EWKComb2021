#! /bin/sh
set -e

echo "Running EWKino Combination"

# SET STATIC VARIABLES
OUTDIR=$1; shift
MODEL=$1; shift
MNLSP=$1; shift
MLSP=$1; shift
TMPDIR=$PWD/combination_${MODEL}_${MNLSP}_${MLSP}/

# PRINTOUTS
echo "Unpacking environement in ${TMPDIR}"

# PREPARE THE RUN DIRECTORY
mkdir $TMPDIR -p
tar -xf Packed_CMSSW10213_COMBINEV820.tar -C $TMPDIR
cd $TMPDIR/CMSSW_10_2_13/src
eval $(scramv1 runtime -sh)
cd $TMPDIR

# PREPARE FOR OUTPUT
export EOS_MGM_URL=root://eosuser.cern.ch; echo "Checking output eosuser.cern.ch..."
eos ls $OUTDIR || eos mkdir -p $OUTDIR

# RUN COMBINE
combine -M AsymptoticLimits /eos/cms/store/group/phys_susy/EWK_comb/comb_trial_v1_May20_2021/combined/WZ/${MODEL}_${MNLSP}_${MLSP}_comb.root -n ${MODEL}_${MNLSP}_${MLSP}_obs -m ${MNLSP}

# COPY OUTPUT TO OUTDIR AND RETRY ON FAILURE
eos cp $TMPDIR/higgsCombine${MODEL}_${MNLSP}_${MLSP}_obs.AsymptoticLimits.mH${MNLSP}.root $OUTDIR/higgsCombine${MODEL}_${MNLSP}_${MLSP}_obs.AsymptoticLimits.mH${MNLSP}.root
if eos ls ${OUTDIR}/higgsCombine${MODEL}_${MNLSP}_${MLSP}_obs.AsymptoticLimits.mH${MNLSP}.root; then
    echo "Copied ok"
else
    cp $TMPDIR/higgsCombine${MODEL}_${MNLSP}_${MLSP}_obs.AsymptoticLimits.mH${MNLSP}.root $OUTDIR/higgsCombine${MODEL}_${MNLSP}_${MLSP}_obs.AsymptoticLimits.mH${MNLSP}.root
fi;

# EXIT
exit 0
