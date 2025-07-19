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
| `CAQRN_SLURM_PARTITION` | `standard` | Slurm partition used for job submission |
| `CAQRN_SLURM_ACCOUNT` | `caqrn` | Slurm account used for job submission |
| `CAQRN_JOB_PREFIX` | `prod_` | Prefix for job names |

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
