---
title: 'Develop and test your first feature on the HPC cluster'
linkTitle: 'Develop and test your first feature on the HPC cluster'
description: 'Learn how to navigate the project codebase and submit test jobs from your sandbox environment'
type: 'docs'
weight: 10
---

{{% alert color="success" %}}

This tutorial covers HPC-specific topics and tools, like working with a batch scheduler (Slurm).
It's designed to help the reader build a general understanding of how software runs on HPC architecture, and teach best practices for feature development, including adding new project dependencies.

This sample is partly inspired by work that I did in a previous role to help onboard new team members to a project, where I taught Git workflows and helped developers set up their environments.

{{% /alert %}}

## Before you begin

In this tutorial, you'll add a simple logging feature to the CAQRN system, and install a new dependency to the project.
You'll test the feature by submitting a job to be run on the HPC cluster's compute nodes from your sandbox environment.

### What you'll need

- A sandbox environment on the Zephyr cluster (see the [Quickstart](/technical-writing/get-started/quickstart/))
- Familiarity with Git
- Familiarity with Python virtual environments

### What you'll learn

- How your sandbox environment works
- How dependencies for the project are managed
- How jobs are submitted from your sandbox to the cluster's compute nodes

## 1. Set up your environment

To add the logging feature, you need to modify an existing file in the codebase.

1. Access a login node on the cluster, replacing the username below with your own:

```bash
ssh alice@zephyr.login.coast-state.edu
```

Login nodes are shared computing resources where users prepare and submit jobs to the cluster's compute nodes.
Avoid running anything resource intensive directly on login nodes, as they can slow down the system for other users.

2. Navigate to the code repo in your sandbox:

```bash
cd ~/caqrn-sandbox/code/caqrn-processing
```

3. Check out the `onboarding` branch from the remote repository:

```bash
git checkout -b onboarding origin/onboarding
```

4. Create and switch to your own feature branch:

```bash
git checkout -b feature/add-environment-logging
```

It's a good idea to isolate changes to the project's codebase to feature branches using names that describe the changes, like `feature/update-aqi-algorithm` or `bugfix/fix-filename-regex`.
In normal development, you'll create feature branches from the `develop` branch and submit merge requests through the GitLab web interface.

5. Source the sandbox environment script:

```bash
source scripts/sandbox_env.sh
```

Notice that your command prompt now shows the name of your activated Python virtual environment.
The sandbox environment script activates your Python virtual environment, and sets environment variables used during job submission and execution.

The following flowchart shows how Python virtual environments are activated on both the login and compute nodes.

{{< mermaid "python-venv-flow" >}}

6. Verify that the script set up your environment by checking a few key variables:

```bash
echo "Python virtual environment: $VIRTUAL_ENV"
echo "Code root: $CAQRN_CODE_ROOT"  
echo "Data root: $CAQRN_DATA_ROOT"
```

You should see output similar to:

```
Python virtual environment: /home/alice/caqrn-sandbox/venv
Code root: /home/alice/caqrn-sandbox/code
Data root: /home/alice/caqrn-sandbox/data
```

## 2. Manage project dependencies using pip

The logging feature you're adding will print environment information about your test job.
In this section, you'll install the `tabulate` library to create formatted tables in the job's Slurm logs.

1. Install the `tabulate` package to your Python virtual environment using pip:

```bash
pip install tabulate
```

2. Test that the installation worked by importing the library:

```bash
python -c "from tabulate import tabulate; print('Success!')"
```

3. Update the project's `requirements.txt` file to include the new dependency.

Make sure you're in the right directory:

```bash
cd ~/caqrn-sandbox/code/caqrn-processing
```

Then run the following command:

```bash
pip freeze > requirements.txt
```

4. Verify that `tabulate` now appears in the requirements file:

```bash
grep tabulate requirements.txt
```

You should see a line of output showing the package and its version number:

```
tabulate==0.9.0
```

The `requirements.txt` file is under source control.
During normal development, keep any changes made to the file as a separate commit.

## 3. Add the logging feature

In this section, you'll implement the logging feature by adding code to an existing module.

1. Navigate to the logging utilities module:

```bash
cd ~/caqrn-sandbox/code/caqrn-processing/src
```

2. Open the `utils.py` file in your preferred editor:

```bash
vim utils.py
```

3. Add the import statement for `tabulate` to the top of the file, after the existing imports:

```python
import os
from tabulate import tabulate
```

4. Find the `print_environment_info()` function stub in the file.
Replace the `pass` statement with the following code:

```python
variables = [
    ["Virtual environment", os.environ.get('VIRTUAL_ENV')],
    ["Code root path", os.environ.get('CAQRN_CODE_ROOT')],
    ["Data root path", os.environ.get('CAQRN_DATA_ROOT')],
    ["Input data path", os.environ.get('CAQRN_INCOMING_DATA')],
]

print(tabulate(variables, headers=["Variable", "Value"], tablefmt="grid"))
```

This function will print a table containing environment information to STDOUT, which will be captured in the Slurm log.

## 4. Submit a test job to the Slurm queue

Now you'll test your feature by submitting a job to the compute cluster.
The test job will use your sandbox environment and code, and you'll see the results in your sandbox data directory.

1. Submit the job using the daily processing job submission script:

```bash
cd ~/caqrn-sandbox/code/caqrn-processing/scripts
./submit_daily_job.sh
```

The output should show that the batch job was submitted:

```
Submitted batch job 12345
```

This script uses the `sbatch` command to submit your job to the Slurm queue, and uses environment variables to determine the context of the job.
It explicitly exports your environment to be available to the process running on the compute nodes.

2. Check your job's status in the queue.  Replace the username below with your own to get a list of jobs submitted under your username from Slurm.

```bash
squeue -u alice
```

The output shows your job details.
Notice that settings such as the compute partition and number of compute nodes for the job are set by the job submission script:

```
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
12345       dev alice_t     alice  R       2:34      4 node[01-04]
```

In general, test jobs should be submitted to the cluster's development partition (`dev`), which provides lower-cost, scaled-back compute resources appropriate for testing.

For performance testing or jobs that need full compute resources, submit to the `standard` partition used by production jobs.

3. Navigate to your Slurm log directory:

```bash
cd ~/caqrn-sandbox/logs/slurm
```

4. Find the log file for your test job, which includes your username and the job ID:

```bash
ls alice_test_daily_*
```

You should see a file like `alice_test_daily_20250101_12345.out`.

5. Monitor job progress by following the log file:

```bash
tail -f alice_test_daily_20250101_12345.out
```

The daily processing job can take up to 30 minutes to complete.
This is a good time for a coffee break!

Your logging function will be called toward the end of execution.

6. When the job completes, you should see your environment table in the log output:

```
+---------------------+------------------------------------------+
| Variable            | Value                                    |
+=====================+==========================================+
| Virtual environment | /home/alice/caqrn-sandbox/venv          |
| Code root path      | /home/alice/caqrn-sandbox/code          |
| Data root path      | /home/alice/caqrn-sandbox/data          |
| Input data path     | /projects/caqrn/shared/data/incoming     |
+---------------------+------------------------------------------+
```

7. Press `Ctrl+C` to stop following the log, then check your data directory for the job's output files:

```bash
cd ~/caqrn-sandbox/data/products
ls -l
```

A date-based directory structure is created by the processing job.
Navigate into the output directory and list the generated files, replacing the date below with today's date:

```bash
cd 2025/01/01
ls -l
```

You should see the two daily files, which were created using the project's shared sensor data at `/projects/caqrn/shared/data/incoming`:

```
daily_aqi_summary_20250101.csv
hourly_aqi_20250101.csv`
```

## Conclusion

This tutorial introduced you to the basic workflow for developing and testing features on the HPC architecture.
In normal development, you'll create feature branches from the `develop` branch, test locally using unit tests, and submit test jobs when needed using what you learned here.

### Summary

- Source `sandbox_env.sh` to set up your environment and activate your Python virtual environment.
- Use `pip freeze` to add a new Python package to the project's `requirements.txt`.
- Use `submit_daily_job.sh` to submit test jobs that run with your sandbox environment context.

### Learn more

- See [Environment variables](/technical-writing/reference/environment-variables) for more information about your sandbox and the production environment.
