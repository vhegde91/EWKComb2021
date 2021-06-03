import os, argparse, itertools, subprocess
from datetime import datetime
from masspoints import masspoints

parser = argparse.ArgumentParser()
parser.add_argument("outdir", help="Output directory on EOS (REQUIRED)")
parser.add_argument("--topology", default=None, required=True, choices=["WZ","WH","ZZ","HZ","HH"], help="Choose topology to target for combination (REQUIRED)")
parser.add_argument("--analyses", default=None, required=True, help="Choose which analyses to include in the combination. Can be a single analysis, or a comma-seperated list (choosing from SOS,zedge,ML,WH,4b,WX) (REQUIRED")
parser.add_argument("--rundir", default="auto", help="Local run-directory that will contain the submission files and batch_logs")
# parser.add_argument("--masspoints", default="all", help="Mass-points to consider for combination")
args = parser.parse_args()

analyses=args.analyses.split(",")
indir = "/eos/cms/store/group/phys_susy/EWK_comb/comb_trial_v1_May20_2021/"

possibleComb = {
	"WZ" : ["SOS","zedge","ML","WX"],
	"WH" : ["ML", "WH", "WX"],
	"ZZ" : ["ML","zedge"],
	"HZ" : ["ML","zedge","4b"],
	"HH" : ["ML","4b"],
}

def prepRundir():
	rundir = "%s_%s"%(datetime.now().strftime("%Y%m%d_%H%M"), args.topology) if args.rundir=="auto" else args.rundir
	# MAKE THE DIRECTORIES
	# rundir = "%s_%s"%(datetime.now().strftime("%Y%m%d"), args.topology) if args.rundir=="auto" else args.rundir
	os.system("rm -rf %s"%rundir)
	os.system("mkdir -p %s/batch_logs"%rundir)

	# CONSTRUCT THE SUBMISSION FILE
	signalmodel = "TChi"+args.topology
	s = '\n   '+signalmodel+'_'
	mps = '{}{}'.format(s, s.join(masspoints[signalmodel]))
	submitter = """## mandatory
JobBatchName          = EWKinoComb2021_$(ClusterId)
executable            = {rundir}/runCombination.sh
output                = {rundir}/batch_logs/$(masspoint)_ID$(ClusterId).out
error                 = {rundir}/batch_logs/$(masspoint)_ID$(ClusterId).err
log                   = {rundir}/batch_logs/$(masspoint)_ID$(ClusterId).log

## jobs' requirements (choose JobFlavours according to size of production: longlunch,workday,tomorrow,nextweek)
requirements          = (OpSysAndVer =?= "CentOS7")
RequestCpus           = 4
+JobFlavour           = "espresso"

getenv		 	= True

## input/output
arguments             = $(masspoint)
transfer_input_files  = Packed_CMSSW10213_COMBINEV820.tar

## one job per mass-point
queue 1 masspoint from ({mps}
)
	""".format(rundir=rundir,mps=mps)
	with open('%s/condor_submitter.sub'%rundir,'w') as outf:
		outf.write(submitter)

	# CONSTRUCT THE EXECUTABLE
	os.system("cp template_runCombination.sh %s/runCombination.sh"%rundir)
	os.system("sed -i \"s+%OUTDIR%+" + args.outdir + "+g\" " + rundir + "/runCombination.sh")

	if len(analyses)==1:
		combcards=""
		t2w = "text2workspace.py %s/cards/%s/%s/card_$\{MASSPOINT}_all.txt -m $\{MNLSP} -o $\{MASSPOINT}_comb.root"%(indir,analyses[0],args.topology)
	else:
		combcards="combineCards.py "+" ".join([an+"=%s/cards/%s/%s/card_$\{MASSPOINT}_all.txt"%(indir,an,args.topology) for an in analyses]) +" -S > card_$\{MASSPOINT}_comb.txt"
		t2w = "text2workspace.py card_$\{MASSPOINT}_comb.txt -m $\{MNLSP} -o $\{MASSPOINT}_comb.root"
	comb= "combine -M AsymptoticLimits $\{MASSPOINT}_comb.root --run blind -n $\{MASSPOINT}_obs -m $\{MNLSP}"
	mdim= "combine -M MultiDimFit $\{MASSPOINT}_comb.root --freezeParameters allConstrainedNuisances -t -1 --setParameters r=0.5 --setParameterRanges r=0,1 -n $\{MASSPOINT}_obs -m $\{MNLSP} --algo grid --points 50 -v 3"
	fitd= "combine -M FitDiagnostics $\{MASSPOINT}_comb.root --saveNormalizations --freezeParameters allConstrainedNuisances -t -1 --setParameters r=0.5 -n $\{MASSPOINT}_obs -m $\{MNLSP}"
	commands=combcards+"\\n"+t2w+"\\n"+comb+"\\n"+mdim+"\\n"+fitd
	os.system("sed -i \"s+%COMBINECOMMANDS%+" + commands + "+g\" " + rundir + "/runCombination.sh")

	return rundir


if __name__ == '__main__':

	# Check if combination is possible
	if any([not an in possibleComb[args.topology] for an in analyses]): raise RuntimeError('Specified analyses are not suitable for combination %s'%args.topology)

	# Check if data-cards are in place for all analyses and all mass-points
	for an in analyses:
		for mp in masspoints["TChi"+args.topology]:
			datacard=indir+"/cards/"+an+"/"+args.topology+"/card_TChi"+args.topology+"_"+mp+"_all.txt"
			if not os.path.isfile(datacard):
				raise RuntimeError("ERROR: Datacard not in place:\n%s"%datacard)

	# Create new submission directory that will contain: [subfile, executable, batch_logs dir]
	rundir = prepRundir()

