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
|	DY normalization	|	TBD	|	norm_dy_<low/med>_year_lnU	|		|		|	NA	|	NA	|	:x:	|		|		|
|	WZ normalization	|	TBD	|	norm_wz_<low/med>_year_lnU	|		|		|	normWZ_ML	|	NA	|	:x:	|		|		|
|	ZZ normalization	|	TBD	|	norm_vv	|		|		|	normZZ_ML	|	NA	|	:x:	|		|		|
|	VV normalization	|	TBD	|	norm_vv	|		|		|	NA	|	NA	|	SyDiBosonXsec	|		|		|
|	X+gamma normalization	|	TBD	|	norm_rares	|		|		|	normconvs_ML	|	NA	|	:x:	|		|		|
|	VVV normaliation	|	TBD	|	norm_rares	|		|		|	normVVV_ML	|	NA	|	:x:	|		|		|
|	VH normalization	|	TBD	|	NA	|		|		|	normVH_ML	|	NA	|	:x:	|		|		|
|	tZq normalization	|	TBD	|	norm_rares	|		|		|	normtZq_ML	|	NA	|	:x:	|		|		|
|	tt normalization	|	TBD	|	norm_tt_<low/med>_year_lnU	|		|		|	NA	|	NA	|	SyTopXsec	|		|		|
|	TTZ normalization	|	TBD	|	norm_rares	|		|		|	normTTX_ML	|	NA	|	:x:	|		|		|
|	Non prompt norm	|	TBD	|	norm_fakes	|		|		|	fakes_ML	|	NA	|	:x:	|		|		|
|	Charge flips norm	|	TBD	|	NA	|		|		|	flips_ML	|	NA	|	:x:	|		|		|
|	WZ tails	|	TBD	|	NA	|		|		|	shapeWZ_ML	|	NA	|	:x:	|		|		|
|	Non prompt shapes	|	TBD	|	shape_mllInclInMET_year	|		|		|	NA	|		|	:x:	|		|		|
|	**Signal Modelling**																			
|	ISR	|	TBD	|	ISR_year	|		|		|	sigISR_ML	|	ISRSyst	|	SyISR	|		|		|
|	FastSimMET	|	TBD	|	NA	|		|		|	sigMET_ML	|	SignalMETFastSIM	|	SyFastMET	|		|		|
|	QCD/Scales	|	TBD	|	CMS_scale_j	|		|		|	sigPDF_ML	|	SignalScale	|	SyScaleShape	|		|		|
|	Fast-Full bb mass	|	TBD	|		|		|		|		|		|	SyFastHmass	|		|		|
|	Fast-Full bb tag	|	TBD	|		|		|		|		|		|	SyFastHTag	|		|		|
|	**Other general**																			
|	PileUp	|	TBD	|	PU	|		|		|	PUW_ML	|	SignalPU	|	SyOthers	|		|		|
|	Luminosity	|	TBD	|	lumi_13TeV_year	|		|		|	lumi_<year,XY,length,bbd,dbeta,ghosts,calib>_ML	|	LumiSyst	|	SyLumi	|		|		|
|	MC statistics	|	TBD	|	autoMCstats	|		|		|	autoMCstats	|	SignalStat<1/2/3>\_<1H/2H>,  stat\_[binname]	|	st*	|		|		|
|	PDF	|	TBD	|		|		|		|		|		|	SyOthers	|		|		|
|	QCD/Scale normalization	|	TBD	|		|		|		|		|		|	SyScaleNorm	|		|		|
|	QCD/Scale shape	|	TBD	|		|		|		|		|		|	SyScaleShape	|		|		|
|	**Objects**																			
|	Electron efficiency	|	TBD	|	lepSF_<1,2,3>	|		|		|	LepSFEl_ML	|	NA	|	SyLepSF	|		|		|
|	Muon efficiency	|	TBD	|	lepSF_<1,2,3>	|		|		|		|	NA	|	SyLepSF	|		|		|
|	Tau efficiency	|	TBD	|	NA	|		|		|	LepSFTau_ML	|	NA	|	:x:	|		|		|
|	b tag efficiency	|	TBD	|	CMS_btag_<lf,hf,lfstats1/2,hfstats1/2,cferr1/2>	|		|		|	btag_<HF,LF>_ML	|	Signal<BC/UDSG>Tag[FastSIM]	|	SyPOGbTag	|		|		|
|	bb tag efficiency	|	TBD	|	NA	|		|		|	NA	|	Signal[Fast]BBTag	|	SyPOGbbVsL	|		|		|
|	JER	|	TBD	|	TBC	|		|		|	NA (applied with JES)	|	SignalJER	|	SyOthers	|		|		|
|	JES	|	TBD	|	TBC	|		|		|	JES<year,CORR>_ML	|	SignalJEC	|	SyOthers	|		|		|
|	Trigger Efficiency	|	TBD	|	TriggerEff_<2l/3l/lowWZ>_year	|		|		|	trigeffstat<bias,stat_year>_ML	|	TrigSyst	|	SyTrigger	|		|		|
|	Trigger SF	|	TBD	|	TriggerSF_<2l/3l/lowWZ>_year	|		|		|	NA	|	NA	|	:question:	|		|		|
|	Prefire corrections	|	TBD	|	Prefire_year	|		|		|	NA	|	SignalPrefire	|	:x:	|		|		|
|	Soft drop jet mass	|	TBD	|	NA	|		|		|	NA	|	SignalRes, SignalFastMass	|	SyJMR	|		|		|
|	JetID	|	TBD	|	NA	|		|		|	NA	|	SignalJetID	|	:question:	|		|		|

### Processes

### Open uncertainties
