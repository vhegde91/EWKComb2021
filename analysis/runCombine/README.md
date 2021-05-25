
## Instructions to produce limits

### Requirements

Instructions are provided to produce the exclusion limits with Combine either locally or on Condor. 

To setup the environment (if not already done)
```bash
> git clone https://github.com/Pmeiring/EWKComb2021.git
> cd EWKComb2021
> git checkout dev_condorsub
```

The recommended CMSSW release (10_2_13) and Combine (v8.20) are already compiled (on CC7) and packed into a tar file, so one can directly proceed to running limits!


### Running locally

To test the limit production for one mass-point, execute:
```bash
> cd analysis/runCombine
> ./runCombination.sh OutputDirOnEos TChiWZ 100 80
```
Please note that the output directory must be a directory on eos. If the test was successful, the script should have finished without error and the limit (.root) file should be copied to the specified output directory.


### Running on Condor

First authenticate your grid certificate:
```bash
> voms-proxy-init --voms cms --valid 144:0
```
Next, make sure to replace the output directory (must be on eos!), which is the first argument on [this line](https://github.com/Pmeiring/EWKComb2021/blob/5982bfea64ef782a9aa6b43531d78993e8208e78/analysis/runCombine/condor_submitter.sub#L17).
Finally, launch the batch jobs:
```bash
> condor_submit condor_submitter.sub
```
One job per {model,mass-point} will be launched and the resulting limit (.root) files will be copied to the specified output directory.
