---
title: 'HPC operations and shell scripting'
linkTitle: 'HPC operations and shell scripting'
description: 'Sample environment configuration and job orchestration scripts'
type: 'docs'
weight: 10
---

In my previous role, I worked with scripts daily -- mostly shell scripts and Perl.
I helped new teammates configure their environments for development and worked with batch job submission scripts like the samples here.

Since I can't share that work directly, I designed these samples using public university HPC documentation as a basis, using this as an exercise to practice designing deployment architecture.

In researching to develop these sample scripts, I taught myself how to work with Slurm and Python virtual environments, and dug into HPC documentation to understand how virtual environments would work in a distributed context.

---

## Environment configuration

On the job, I helped onboard developers and standardize how teammates configured their local environments. The environment scripts here represent that work.

```bash
# Activate Python virtual environment
source "$HOME/caqrn-sandbox/venv/bin/activate"

# Environment identifier (used by job scripts)
export CAQRN_ENV="development"

# Paths
export CAQRN_CODE_ROOT="$HOME/caqrn-sandbox/code"
export CAQRN_DATA_ROOT="$HOME/caqrn-sandbox/data"
export CAQRN_LOG_ROOT="$HOME/caqrn-sandbox/logs"

# Slurm settings
export CAQRN_SLURM_PARTITION="dev"
export CAQRN_SLURM_ACCOUNT="caqrn-dev"
```

Full scripts: [sandbox_env.sh](https://github.com/nandstand/sample-site/blob/main/reference/sandbox_env.sh), [staging_env.sh](https://github.com/nandstand/sample-site/blob/main/reference/staging_env.sh), [production_env.sh](https://github.com/nandstand/sample-site/blob/main/reference/production_env.sh)

---

## Job orchestration

Submitting and managing batch jobs was a large part of the role — monitoring queues, tracking down why jobs failed, maintaining scripts. The job scripts here handle submission and execution via Slurm, which is a different batch scheduler than the one that I used on the job.

```bash
# Submit job with environment-specific settings
sbatch \
    --job-name="$JOB_NAME" \
    --partition="$CAQRN_SLURM_PARTITION" \
    --account="$CAQRN_SLURM_ACCOUNT" \
    --export=ALL \
    "${CAQRN_CODE_ROOT}/scripts/processing_job.sh"
```

Full scripts: [submit_daily_job.sh](https://github.com/nandstand/sample-site/blob/main/reference/submit_daily_job.sh), [processing_job.sh](https://github.com/nandstand/sample-site/blob/main/reference/processing_job.sh)
