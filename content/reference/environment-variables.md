---
title: 'Environment variables'
linkTitle: 'Environment variables'
description: 'Description goes here'
type: 'docs'
weight: 50 
---

Some information about how the project uses the environment variables during job submission and execution.

## Quick reference

{{< tabpane markdown=true >}}

{{< tab header="Sandbox" >}}

| Variable | Value | Purpose |
|----------|-------|---------|
| `CAQRN_ENV` | `development` | Environment identification |
| `CAQRN_CODE_ROOT` | `$HOME/caqrn-sandbox/code` | Root directory for source code |
| `CAQRN_CONFIG_PATH` | `$HOME/caqrn-sandbox/code/caqrn-config/dev` | Configuration files directory |
| `CAQRN_DATA_ROOT` | `$HOME/caqrn-sandbox/data` | Root directory for data storage |
| `CAQRN_LOG_ROOT` | `$HOME/caqrn-sandbox/logs` | Root directory for log files |
| `CAQRN_INCOMING_DATA` | `/projects/caqrn/shared/data/incoming` | Raw sensor data input |
| `CAQRN_TEMP_DIR` | `$HOME/caqrn-sandbox/data/processing` | Temporary processing work directory |
| `CAQRN_SLURM_PARTITION` | `dev` | Partition used for Slurm job submission |
| `CAQRN_SLURM_ACCOUNT` | `caqrn-dev` | Account used for Slurm job submission |
| `CAQRN_JOB_PREFIX` | `${USER}_test_` | Prefix for Slurm job names |

{{< /tab >}}

{{< tab header="Staging" >}}

| Variable | Value | Purpose |
|----------|-------|---------|
| `CAQRN_ENV` | `staging` | Environment identification |
| `CAQRN_CODE_ROOT` | `/projects/caqrn/develop/code` | Root directory for source code |
| `CAQRN_CONFIG_PATH` | `/projects/caqrn/develop/code/caqrn-config/dev` | Configuration files directory |
| `CAQRN_DATA_ROOT` | `/projects/caqrn/develop/data` | Root directory for data storage |
| `CAQRN_LOG_ROOT` | `/projects/caqrn/develop/logs` | Root directory for log files |
| `CAQRN_INCOMING_DATA` | `/projects/caqrn/develop/data/incoming` | Raw sensor data input |
| `CAQRN_TEMP_DIR` | `/projects/caqrn/develop/data/processing` | Temporary processing work directory |
| `CAQRN_SLURM_PARTITION` | `standard` | Partition used for Slurm job submission |
| `CAQRN_SLURM_ACCOUNT` | `caqrn` | Account used for Slurm job submission |
| `CAQRN_JOB_PREFIX` | `staging_` | Prefix for Slurm job names |

{{< /tab >}}

{{< tab header="Production" >}}

| Variable | Value | Purpose |
|----------|-------|---------|
| `CAQRN_ENV` | `production` | Environment identification |
| `CAQRN_CODE_ROOT` | `/projects/caqrn/production/code` | Root directory for source code |
| `CAQRN_CONFIG_PATH` | `/projects/caqrn/production/code/caqrn-config/prod` | Configuration files directory |
| `CAQRN_DATA_ROOT` | `/projects/caqrn/production/data` | Root directory for data storage |
| `CAQRN_LOG_ROOT` | `/projects/caqrn/production/logs` | Root directory for log files |
| `CAQRN_INCOMING_DATA` | `/projects/caqrn/production/data/incoming` | Raw sensor data input |
| `CAQRN_TEMP_DIR` | `/projects/caqrn/production/data/processing` | Temporary processing work directory |
| `CAQRN_SLURM_PARTITION` | `standard` | Partition used for Slurm job submission |
| `CAQRN_SLURM_ACCOUNT` | `caqrn` | Account used for Slurm job submission |
| `CAQRN_JOB_PREFIX` | `prod_` | Prefix for Slurm job names |

{{< /tab >}}

{{< /tabpane >}}




## Variables

Should put some text here.

### CAQRN_ENV


## Environment scripts

Something about the project using environment scripts for different job contexts.
Briefly explain that scheduled staging and production jobs use these environment scripts.

{{< tabpane lang="bash" >}}
{{< tab header="Sandbox" >}}
{{< include-file "/reference/sandbox_env.sh" >}}
{{< /tab >}}
{{< tab header="Staging" >}}
{{< include-file "/reference/staging_env.sh" >}}
{{< /tab >}}
{{< tab header="Production" >}}
{{< include-file "/reference/production_env.sh" >}}
{{< /tab >}}
{{< /tabpane >}}
