Project Deployment
---

## System / service account

- Owns the cron and deployed code, and submits the automated batch jobs
- Non-login account `caqrn`
- Senior developers able to sudo in if direct access necessary
- Sources: 
    - https://www.beyondtrust.com/blog/entry/how-to-manage-and-secure-service-accounts-best-practices
    - https://en.wikipedia.org/wiki/Service_account

## Slurm / compute nodes

- The compute nodes would mount to wherever the login nodes' python venvs live
- Developers log into the login nodes and work from their sandbox environments
- Sample docs won't cover local tests, just test jobs submitted to Slurm

## Environment

- Environment scripts set up paths, activate python environment, and add project to PYTHONPATH
- Shared incoming data on the dev server to keep things simple
- The deployed code uses a Python virtual environment (dev/main)
- Developers use a Python virtual environment in their sandboxes
- Have to activate on login
- Small team: just manage dependencies via requirements file / pip

## Python virtual environments / libraries on HPC infrastructure

- Python virtual environments allow developers to isolate and test new dependencies in a way that is easy to understand (and write about).
  - Source: https://docs.python.org/3/library/venv.html
- System dependencies on HPC clusters are often managed via things like the `module load` command to load modules already installed on the compute nodes 
  - Source: https://www.sherlock.stanford.edu/docs/user-guide/running-jobs/#example-sbatch-script
  - Other source: https://www.carc.usc.edu/user-guides/advanced-hpc-programming/programming-languages/python
- Since this is just a sample project, and to keep things simple, we'll assume that it's allowed and feasible to activate a python virtual environment that lives on storage mounted to the login node, from the compute node.
  - This document suggests using pip to install in an HPC env: https://www.hpc.iastate.edu/guides/virtual-environments/python-virtual-environments
- We'll also omit the concept of managing modules on a public HPC to keep the scope of the samples more narrow.  Let's just assume we have the correct version of Python loaded on the login and compute nodes

## Cron

- Just one daily job and one set of data coming in for simplicity's sake
- Not even going to cover delivery or API stuff in any of the docs...
- Cron would source env and then run the orchestration script

```bash
0 2 * * * caqrn source /home/caqrn/.caqrn_env && /caqrn/code/caqrn-processing/scripts/download_data.sh
0 3 * * * caqrn source /home/caqrn/.caqrn_env && /caqrn/code/caqrn-processing/scripts/submit_daily_job.sh
0 1 * * 0 caqrn source /home/caqrn/.caqrn_env && /caqrn/code/caqrn-processing/scripts/cleanup.sh
```
