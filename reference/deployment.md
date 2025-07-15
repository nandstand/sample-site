Project Deployment
---

## System / service account

- Owns the cron and live code, and submits the automated batch jobs
- Non-login account `caqrn`
- Senior developers able to sudo in if direct access necessary
- Sources: 
    - https://www.beyondtrust.com/blog/entry/how-to-manage-and-secure-service-accounts-best-practices
    - https://en.wikipedia.org/wiki/Service_account

## Slurm / compute nodes

- Compute partitions: dev (`compute-dev`), prod (`compute-prod`)
- The dev and prod servers are login nodes
- The project would have access to 20-30 compute nodes
- The compute nodes would mount to wherever the login nodes' python venvs live
- Developers submit test jobs from the dev server (their sandboxes)
- Sample docs won't cover local tests, just test jobs submitted to Slurm

## Environment

- Environment scripts set up paths, activate python environment, and add project to PYTHONPATH
- Shared incoming data on the dev server to keep things simple
- Every deployment uses an isolated Python venv, including developers' sandboxes
- Have to activate on login
- Small team: just manage dependencies via requirements file / pip

## Cron

- Just one daily job and one set of data coming in for simplicity's sake
- Not even going to cover delivery or API stuff in any of the docs...
- Cron would source env and then run the orchestration script

```bash
0 2 * * * caqrn source /home/caqrn/.caqrn_env && /caqrn/code/caqrn-processing/scripts/download_data.sh
0 3 * * * caqrn source /home/caqrn/.caqrn_env && /caqrn/code/caqrn-processing/scripts/submit_daily_job.sh
0 1 * * 0 caqrn source /home/caqrn/.caqrn_env && /caqrn/code/caqrn-processing/scripts/cleanup.sh
```


