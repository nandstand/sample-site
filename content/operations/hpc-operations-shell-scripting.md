---
title: 'HPC operations and shell scripting'
linkTitle: 'HPC operations and shell scripting'
description: 'Sample environment configuration and job orchestration scripts'
type: 'docs'
weight: 10
---

In a previous role, I worked on a scientific computing team where I maintained and deployed software on a high-performance computing (HPC) cluster. Day to day, this involved working with shell scripts that configured environments and orchestrated batch jobs — writing new scripts, troubleshooting failures, and helping teammates get set up.

The sample scripts in this repository represent that kind of work. I designed a fictional project architecture based on public university HPC documentation and wrote scripts that reflect the patterns I worked with on the job.

---

## Environment configuration

On the job, I helped onboard developers and standardize how teammates configured their local environments. The environment scripts here represent that work — setting up paths, activating Python virtual environments, and configuring scheduler parameters.

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

Submitting and managing batch jobs was routine operational work — monitoring queues, tracking down why jobs failed, fixing scripts. The job scripts here handle submission and execution on a Slurm cluster.

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

---

## Background

I based the project architecture on documentation from [Stanford's Sherlock cluster](https://www.sherlock.stanford.edu/docs/), [USC's CARC](https://www.carc.usc.edu/user-guides), and other university HPC providers. See the full list of [sources](https://github.com/nandstand/sample-site/blob/main/reference/sources.md). Building these samples gave me a chance to learn Slurm (my previous work used a different scheduler) and dig deeper into Python virtual environment behavior in distributed contexts.

The [documentation samples](/technical-writing/) on this site are written for this fictional project. I designed the scripts first, then wrote documentation explaining how to use them — the same way I worked on the job.
