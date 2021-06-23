# Combination

## Correlations

### Nuisance names and correlations

:white_check_mark: correlation implemented in latest result
:recycle: needs some more dicussion
:x: not correlated / not considered

Combination names TBC

|	Source	|	Name	|	SOS	|	ZEdge	|	WH	|	ML	|	4b	|	hadronic WX (SUS-21-002)	|	Comment	|	Correlation implemented	|
|	---	|	---	|	---	|	---	|	---	|	---	| --- | --- |	---	|	---	|				
|	**SM backgrounds**																			
|	DY normalization	|	TBD	|	norm_dy_<low/med>_year_lnU	|		|		|	NA	|	NA	|		|		|		|
|	WZ normalization	|	TBD	|	norm_wz_<low/med>_year_lnU	|		|		|	normWZ_ML	|	NA	|		|		|		|
|	ZZ normalization	|	TBD	|	norm_vv	|		|		|	normZZ_ML	|	NA	|		|		|		|
|	VV normalization	|	TBD	|	norm_vv	|		|		|	NA	|	NA	|		|		|		|
|	X+gamma normalization	|	TBD	|	norm_rares	|		|		|	normconvs_ML	|	NA	|		|		|		|
|	VVV normaliation	|	TBD	|	norm_rares	|		|		|	normVVV_ML	|	NA	|		|		|		|
|	VH normalization	|	TBD	|	NA	|		|		|	normVH_ML	|	NA	|		|		|		|
|	tZq normalization	|	TBD	|	norm_rares	|		|		|	normtZq_ML	|	NA	|		|		|		|
|	tt normalization	|	TBD	|	norm_tt_<low/med>_year_lnU	|		|		|	NA	|	NA	|		|		|		|
|	TTZ normalization	|	TBD	|	norm_rares	|		|		|	normTTX_ML	|	NA	|		|		|		|
|	Non prompt norm	|	TBD	|	norm_fakes	|		|		|	fakes_ML	|	NA	|		|		|		|
|	Charge flips norm	|	TBD	|	NA	|		|		|	flips_ML	|	NA	|		|		|		|
|	WZ tails	|	TBD	|	NA	|		|		|	shapeWZ_ML	|	NA	|		|		|		|
|	Non prompt shapes	|	TBD	|	shape_mllInclInMET_year	|		|		|	NA	|		|		|		|		|
|	**Signal Modelling**																			
|	ISR	|	TBD	|	ISR_year	|		|		|	sigISR_ML	|	ISRSyst	|		|		|		|
|	FastSimMET	|	TBD	|	NA	|		|		|	sigMET_ML	|	SignalMETFastSIM	|		|		|		|
|	QCD/Scales	|	TBD	|	CMS_scale_j	|		|		|	sigPDF_ML	|	SignalScale	|		|		|		|
|	**Other general**																			
|	PileUp	|	TBD	|	PU	|		|		|	PUW_ML	|	SignalPU	|		|		|		|
|	Luminosity	|	TBD	|	lumi_13TeV_year	|		|		|	lumi_<year,XY,length,bbd,dbeta,ghosts,calib>_ML	|	LumiSyst	|		|		|		|
|	MC statistics	|	TBD	|	autoMCstats	|		|		|	autoMCstats	|	SignalStat<1/2/3>\_<1H/2H>,  stat\_[binname]	|		|		|		|
|	**Objects**																			
|	Electron efficiency	|	TBD	|	lepSF_<1,2,3>	|		|		|	LepSFEl_ML	|	NA	|		|		|		|
|	Muon efficiency	|	TBD	|	lepSF_<1,2,3>	|		|		|		|	NA	|		|		|		|
|	Tau efficiency	|	TBD	|	NA	|		|		|	LepSFTau_ML	|	NA	|		|		|		|
|	b tag efficiency	|	TBD	|	CMS_btag_<lf,hf,lfstats1/2,hfstats1/2,cferr1/2>	|		|		|	btag_<HF,LF>_ML	|	Signal<BC/UDSG>Tag[FastSIM]	|		|		|		|
|	bb tag efficiency	|	TBD	|	NA	|		|		|	NA	|	Signal[Fast]BBTag	|		|		|		|
|	JER	|	TBD	|	TBC	|		|		|	NA (applied with JES)	|	SignalJER	|		|		|		|
|	JES	|	TBD	|	TBC	|		|		|	JES<year,CORR>_ML	|	SignalJEC	|		|		|		|
|	Trigger Efficiency	|	TBD	|	TriggerEff_<2l/3l/lowWZ>_year	|		|		|	trigeffstat<bias,stat_year>_ML	|	TrigSyst	|		|		|		|
|	Trigger SF	|	TBD	|	TriggerSF_<2l/3l/lowWZ>_year	|		|		|	NA	|	NA	|		|		|		|
|	Prefire corrections	|	TBD	|	Prefire_year	|		|		|	NA	|	SignalPrefire	|		|		|		|
|	Soft drop jet mass	|	TBD	|	NA	|		|		|	NA	|	SignalRes, SignalFastMass	|		|		|		|
|	JetID	|	TBD	|	NA	|		|		|	NA	|	SignalJetID	|		|		|		|

### Processes

### Open uncertainties
