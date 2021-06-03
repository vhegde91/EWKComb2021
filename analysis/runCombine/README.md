
## Instructions to produce limits

Instructions are provided to produce the exclusion limits with Combine either locally or on Condor. 

### Step 0: Requirements

To setup the environment (if not already done)
```bash
git clone https://github.com/Pmeiring/EWKComb2021.git
cd EWKComb2021
git checkout dev_condorsub
```

The recommended CMSSW release (10_2_13) and Combine (v8.20) are already compiled (on CC7) and packed into a tar file, so one can directly proceed to running limits!


### Step 1: Preparing a combination

To run a particular combination, you need to prepare a local run directory that will contain all scripts and infrastructure to run both locally and on batch.
For example:
```bash
cd analysis/runCombine
python prepareCombination.py outputDIRonEOS --topology WZ --analyses SOS,ML --rundir LocalDIR
```
A single or multiple (with a comma-separated list) analyses can be specified to combine results for a particular topology. Furthermore, please note that the output directory must be a directory on eos. The script will prepare a local run directory ```LocalDIR``` after checking that the relevant data-cards are in place.

### Step 2.1: Running locally

To test the limit production for one mass-point, execute:
```bash
chmod +x LocalDIR/runCombination.sh
LocalDIR/runCombination.sh TChiWZ_100_80
```
If the test was successful, the script should have finished without error and the (.root) files should be copied to the specified output directory on EOS. If you need more feedback from the test, it may be useful to remove the last few lines of ```LocalDIR/runCombination.sh``` that clean the running directory.


### Step 2.2: Running on Condor

First authenticate your grid certificate:
```bash
voms-proxy-init --voms cms --valid 144:0
```
Launch the batch jobs:
```bash
condor_submit LocalDIR/condor_submitter.sub
```
One job per mass-point will be launched and the resulting limit (.root) files will be copied to the specified output directory on EOS. Log files for this combination can be found in ```LocalDIR/batch_logs```
