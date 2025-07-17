General
---

## What these samples will cover

- Deployment / ops related architecture

## What they won't

- Software architecture / design for the application itself

## Domain / what kind of products

- Air quality monitoring
- The Coastal Air Quality Research Network (CAQRN) uses remote sensor data to produce air quality index products for public environmental health research.

## About the HPC cluster

- CAQRN is hosted on a university owned cluster
- University name: Coastal State University
- Cluster name: Zephyr
- Login node domain: `zephyr.login.coast-state.edu`
- Small project that uses a university's general purpose shared cluster, which is a common set up for research groups
  - Source: https://www.depts.ttu.edu/hpcc/
  - Source: https://computing.sas.upenn.edu/research/high-performance
  - Source: https://www.sherlock.stanford.edu/docs/#why-use-sherlock

## System overview

### Languages and data types

- Python for the primary processing components
- Bash for orchestration scripts
- Slurm for batch job scheduler (most common, lots of reference available)
- Data formats would include CSV, JSON, or NetCDF
- YAML for config tables because that's what I've been using lately

### Architecture

- Software project lives on a public university / research HPC
- Development and production deployments on the HPC filesystem, automated using whatever makes sense (cron, or whatever scheduling is available on the HPC)
- Shared service account user owns the deployed code
- Devs would log in and do work on login nodes from their home directories, with these docs covering getting that environment configured

## Source control

- The project uses an internal GitLab server, hosted by the university
  - Source: https://helpdesk.cs.umd.edu/faq/connecting/gitlab.html
- Server accessed at: `gitlab.coast-state.edu`
- Clone: `git clone git@gitlab.coast-state.edu:caqrn/caqrn-processing.git`
- Development branch: `develop`
- Production branch: `main`
- The project config tables are in their own repo
- Repos: `caqrn-processing` and `caqrn-config`

## Directory structure

### Service account / deployed code

- These would differ slightly for the dev and prod deployments
- Maybe a separate `/caqrn/` and `/caqrn-dev/` structure
- Prod deployment would have the prod branch checked out, dev would have dev...
- Separate dev and prod config tables under the config repo

```
/caqrn/
  code/
    caqrn-processing/
      main.py
      ...
      scripts/
      requirements.txt
    caqrn-config/
      dev/
      prod/
  data/
    incoming/
    processing/
    products/
  logs/
    processing/
    slurm/
    cron/
  venv/                 # service account would use Python venv
```

### Developer sandbox 

```
/home/user/caqrn-sandbox/
  code/
    caqrn-processing
    caqrn-config
  data/
    processing/
    products/
  logs/
    processing/
    slurm/
    cron/
  venv/
```

## Output files

-
  - Source:
