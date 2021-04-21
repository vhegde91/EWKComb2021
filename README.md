# Combination

## Correlations

### Nuisance names and correlations

:white_check_mark: correlation implemented in latest result
:recycle: needs some more dicussion
:x: not correlated / not considered

Create following names based on SOS

| Stop-0l               | Stop-1l               | Stop-2l       | comment       | Correlation implemented |
| -------               | -------               | -------       | -----------   | -------                 |
| ISR_Weight            | ISRSystsignal         | isr           | ISR, signal   | :white_check_mark: | 
| ISR_Weight_background | ISR16SystBG           | n/a           | ISR, background | :white_check_mark: |
| LHEScale              | q2Syst                | n/a           | stop-2l has ttZ and ttbar scale uncertainty decorrelated | :recycle: |
| LHESigScale           | n/a                   | scale         | stop-1l has all scale variations correlated | :recycle: |
| PDF_Weight            | pdfSyst(BG)           | PDF           | PDF (Bkg and tt+DM only) | :white_check_mark: |
| JES                   | jesSyst               | JEC           | JES | :white_check_mark: |
| PU_Weight             | pileupSyst            | PU            | pileup modeling | :white_check_mark: |
| Prefire_Weight        | L1prefireSyst         | L1prefire     | L1 prefire | :white_check_mark: |
| b_heavy               | bTagEffHFSyst         | SFb           | b-tag | :white_check_mark: |
| b_light               | bTagEffLFSyst         | SFl           | mistag | :white_check_mark: |
| b_fast                | bTagFSEffSystsignal   | btagFS        | b-tag FastSim | :white_check_mark: |
| ivfunc                | softbSFSyst           | n/a           | soft b-tagging | :white_check_mark: |
| eff_restoptag         | resttagSFSyst         | n/a           | resolved top tag | :white_check_mark: |
| eff_toptag            | merttagSFSyst         | n/a           | merged top tag | :white_check_mark: |
| lumi                  | LumiSyst              | Lumi          | integrated luminosity | :white_check_mark: |
| toppt                 | n/a                   | topPt         | top pT reweighting | :white_check_mark: |
| TTZ_SF                | ttZxsecSystZ          | TTZ_SF        | ttZ x-sec uncertainty | :white_check_mark: |
| trigger_err           | TrigSyst              | trigger2l     | correlate 0l & 1l (same triggers) | :white_check_mark: |
| metres                | n/a                   | unclEn        | unclustered energy modeling | :white_check_mark: |
| MET_Unc               | SigGenMETunc          | FSmet         | gen/reco averaging for FastSim | :white_check_mark: |
| eff_e/err_mu/eff_tau  | lepSFSyst/tauSFSyst2l | leptonSF      | lepton ID/isolation SFs. Not correlated. | :x: |

### Processes

### Open uncertainties
