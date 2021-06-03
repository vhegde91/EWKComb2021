#! /bin/sh
set -e

echo "Running EWKino Combination of $1"

# SET STATIC VARIABLES
MASSPOINT=$1; shift
MODEL="$(cut -d'_' -f1 <<<"$MASSPOINT")"
MNLSP="$(cut -d'_' -f2 <<<"$MASSPOINT")"
MLSP="$(cut -d'_' -f3 <<<"$MASSPOINT")"
OUTDIR=%OUTDIR%
TMPDIR=$PWD/combination_${MASSPOINT}/

# PRINTOUTS
echo "Unpacking environment in ${TMPDIR}"

# PREPARE THE RUN DIRECTORY
mkdir $TMPDIR -p
tar -xf Packed_CMSSW10213_COMBINEV820.tar -C $TMPDIR
cd $TMPDIR/CMSSW_10_2_13/src
eval $(scramv1 runtime -sh)
cd $TMPDIR

# PREPARE FOR OUTPUT
export EOS_MGM_URL=root://eosuser.cern.ch; echo "Checking output eosuser.cern.ch..."
eos ls -s $OUTDIR || eos mkdir -p $OUTDIR

# RUN COMBINE
echo "Running combine"
%COMBINECOMMANDS%

# COPY OUTPUT TO OUTDIR AND RETRY ON FAILURE
echo "Copying output"
eos cp $TMPDIR/higgsCombine*.root $OUTDIR/
if eos ls -s ${OUTDIR}/higgsCombine${MASSPOINT}_obs.AsymptoticLimits.mH${MNLSP}.root; then
    echo "Copied ok"
else
    cp $TMPDIR/higgsCombine*.root $OUTDIR/
fi;

# CLEAN RUNNING DIRECTORY
cd ..
rm -rf combination_${MASSPOINT}

# EXIT
exit 0
