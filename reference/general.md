General
---

## Objective

### What these samples will cover

- Deployment / ops related architecture

### What they won't

- Software architecture / design for the application itself

## About the research network

- The Coastal Air Quality Research Network (CAQRN) project uses remote sensor data to produce air quality index products for public environmental health research
- Air quality index is EPA's way of communicating outdoor air quality
  - Source: https://www.airnow.gov/aqi/aqi-basics/
- Data products:
  - `daily_aqi_summary_YYYYMMDD.csv`
  - `hourly_aqi_YYYYMMDD.csv`

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

### Project deployed code

- These would differ slightly for the dev and prod deployments
- Separate structures, with the repos probably being owned by a lead or project manager with write permissions
  - Source: https://hpcc.umd.edu/hpcc/help/storage.html
  - Source: https://hpc.nih.gov/docs/groups.html
- Prod deployment would have the main branch checked out, dev would have develop...
- Separate dev and prod config tables under the config repo

```
/projects/caqrn/
  production/
    ...
  develop/
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
    venv/
  shared/
    data/
      incoming/     # link to develop incoming data
```

### Developer sandbox 

- Developers would work from their home sandbox directories

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
