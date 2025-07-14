General
---

## What this reference needs to cover

Mainly deployment and environment related information
Sample docs will cover onboarding stuff for developers, ops related troubleshooting, environment set up, etc.

## Domain / what kind of products

Air quality monitoring
The Coastal Air Quality Research Network (CAQRN) uses remote sensor data to produce air quality index products for public environmental health research.

## Customers

CAQRN provides products to government agencies, public health departments, and research groups.

## System overview

Python for the primary processing components
Bash for orchestration scripts
Slurm for batch job scheduler (most common, lots of reference available)
Data formats would include CSV, JSON, or NetCDF
YAML for config tables
Dev and prod servers (`caqrn-dev` and `caqrn-prod`), with automated processes running under a service account user (`caqrn`)
Devs would log in and do work on the dev server (login node)

## Source control

The project uses an internal GitLab server
Development branch: `develop`
Production branch: `main`
The project config tables are in their own repo
Repos: `caqrn-processing` and `caqrn-config`

## Directory structure

### Service account / deployed code

These woudl differ slightly on the prod and dev servers
Prod server would have the prod branch checked out, dev would have dev...
Separate dev and prod config tables under the config repo

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
