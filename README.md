# MCMC runs for extensions to $\Lambda\mathrm{CDM}$

This repository contains yaml blocks and MCMC chains of extensions to the CPL cosmological model.
To clone this repository, paste
```bash
git clone --recursive https://github.com/dlehdgk/cpl_extensions.git
```
into the terminal.

## Index

- **chains**: contains the outputs of MCMC runs on COBAYA
- **inputs**: contains the input yaml file for COBAYA
- **likelihoods**: submodule containing the cosmological likelihood blocks
- **parameters**: contains the yaml blocks for the cosmological parameters to be sampled by COBAYA
- **scripts**: contains the scripts to run the files in the *inputs* directory on the HPC
- **theories**: contains the CAMB theory yaml blocks

## Adding new input yaml files

To add new input yaml files to run, create a new file in the **inputs** directory of the following format:

```yaml
theory: !defaults [../theories/<theory_name>]
likelihood: !defaults [../likelihoods/<likelihood_name1>, ../likelihoods/<likelihood_name2>, ...]
params: !defaults [../parameters/<param_name>]

# need to include a prior on A_act if using the ACT DR6 CMB dataset as a part of the likelihood combination
#prior:
#   cal_dip_prior: 'lambda A_act: stats.norm.logpdf(A_act, loc = 1.0, scale = 0.003)'

sampler:
  mcmc:
    drag: true
    oversample_power: 0.4
    proposal_scale: 1.9
    covmat: auto
    Rminus1_stop: 0.01
    Rminus1_cl_stop: 0.2
resume: true
output: ../chains/<run_name>
```
