---
title: 'Environment variables'
linkTitle: 'Environment variables'
description: 'Description goes here'
type: 'docs'
weight: 50 
---

{{% alert color="success" %}}

On this page, I used Mermaid and a custom Hugo shortcode to single source a diagram from a Mermaid text file.
I also modified a shortcode provided by the Docsy theme to build the quick reference at the top of the page.

You can view the source for each of these in the site's GitHub repository. See the [diagram's source file](https://github.com/nandstand/sample-site/blob/main/diagrams/python-venv-flow.mmd), the [shortcode used to render it](https://github.com/nandstand/sample-site/blob/main/layouts/shortcodes/mermaid.html), and the [modified version of Docsy's tabpane shortcode](https://github.com/nandstand/sample-site/blob/main/layouts/shortcodes/tabpane.html).

{{% /alert %}}

Some information about how the project uses the environment variables during job submission and execution.

## Quick reference

{{< tabpane markdown=true >}}

{{< tab header="Sandbox" >}}

| Variable | Value | Purpose |
|----------|-------|---------|
| `CAQRN_ENV` | `development` | Environment identification |
| `CAQRN_CODE_ROOT`| `$HOME/caqrn-sandbox/code` | Root directory for source code |
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

---

## CAQRN_ENV

**Purpose:** Identifies the active environment.

| Environment | Value |
|-------------|-------|
| Production | `production` |
| Staging | `staging` |
| Sandbox | `development` |

**Usage:** Used by Slurm job scripts to determine which Python virtual environment to activate at job execution time.

The following flowchart summarizes how the active environment's associated Python virtual environment is reactivated on the compute node(s).

{{< mermaid "python-venv-flow" >}}

---

## CAQRN_CODE_ROOT

**Purpose**: Root directory containing project source code repositories.

| Environment | Value |
|-------------|-------|
| Production | `/projects/caqrn/production/code` |
| Staging | `/projects/caqrn/develop/code` |
| Sandbox | `$HOME/caqrn-sandbox/code` |

**Usage**: Referenced by scripts to locate project modules and executables. Used in `PYTHONPATH` construction.

---

## CAQRN_CONFIG_PATH

**Purpose**: Directory containing environment-specific configuration files.

| Environment | Value |
|-------------|-------|
| Production | `/projects/caqrn/production/code/caqrn-config/prod` |
| Staging | `/projects/caqrn/develop/code/caqrn-config/dev` |
| Sandbox | `$HOME/caqrn-sandbox/code/caqrn-config/dev` |

**Usage**: Passed to processing jobs via `--config` parameter to load application configuration settings.

---

## CAQRN_DATA_ROOT

**Purpose**: Root directory for all data storage including downloaded data directories, temporary workspaces for Slurm jobs, and output product directories.

| Environment | Value |
|-------------|-------|
| Production | `/projects/caqrn/production/data` |
| Staging | `/projects/caqrn/develop/data` |
| Sandbox | `$HOME/caqrn-sandbox/data` |

**Usage**: Base path for constructing data directories.  Contains the following subdirectories:

- `incoming/` - Date-based directories created by download scripts
- `processing/` - Temporary working directories for Slurm jobs
- `products/` - Date-based output directories for Slurm jobs

Slurm jobs create date-based subdirectories in the format `$CAQRN_DATA_ROOT/products/YYYY/MM/DD/` for product outputs.

---

## CAQRN_LOG_ROOT

**Purpose**: Root directory for all log file storage.

| Environment | Value |
|-------------|-------|
| Production | `/projects/caqrn/production/logs` |
| Staging | `/projects/caqrn/develop/logs` |
| Sandbox | `$HOME/caqrn-sandbox/logs` |

**Usage**: Referenced by job submission scripts for Slurm log file output paths (`--output` and `--error` parameters).
Used to construct paths to application logs at `$CAQRN_LOG_ROOT/processing/`.

---

## CAQRN_INCOMING_DATA

**Purpose**: Directory containing downloaded sensor data.

| Environment | Value |
|-------------|-------|
| Production | `/projects/caqrn/production/data/incoming` |
| Staging | `/projects/caqrn/develop/data/incoming` |
| Sandbox | `/projects/caqrn/shared/data/incoming` |

**Usage**: Processing jobs read input files from date-based subdirectories under this path.
By default, sandbox environments use the staging environment's downloaded sensor data, shared at `/projects/caqrn/shared/data/incoming`.

---

## CAQRN_TEMP_DIR

**Purpose**: Directory for temporary files created during processing.

| Environment | Value |
|-------------|-------|
| Production | `/projects/caqrn/production/data/processing` |
| Staging | `/projects/caqrn/develop/data/processing` |
| Sandbox | `$HOME/caqrn-sandbox/data/processing` |

**Usage**: Working directory for intermediate files created during processing.

---

## CAQRN_SLURM_PARTITION

**Purpose**: Slurm partition for job submission.

| Environment | Value |
|-------------|-------|
| Production | `standard` |
| Staging | `standard` |
| Sandbox | `dev` |

**Usage**: Passed to `sbatch --partition` parameter. Scheduled production and staging jobs use the cluster's general-purpose partition, while development jobs use the dedicated development partition.

---

## CAQRN_SLURM_ACCOUNT

**Purpose**: Slurm account for job submission.

| Environment | Value |
|-------------|-------|
| Production | `caqrn` |
| Staging | `caqrn` |
| Sandbox | `caqrn-dev` |

**Usage**: Passed to `sbatch --account` parameter. Separates development resource usage from production/staging.

---

## CAQRN_JOB_PREFIX

**Purpose**: Prefix applied to Slurm job names.

| Environment | Value |
|-------------|-------|
| Production | `prod_` |
| Staging | `staging_` |
| Sandbox | `${USER}_test_` |

**Usage**: Prepended to job names in submission scripts. Helps identify job source in queue listings and log files.
