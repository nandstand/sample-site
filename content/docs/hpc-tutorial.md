---
title: 'Develop and test your first feature on the HPC cluster'
linkTitle: 'Develop and test your first feature on the HPC cluster'
description: 'Learn how to navigate the CAQRN project codebase and submit test jobs from your sandbox environment.'
type: 'docs'
weight: 10
---

The Coastal Air Quality Research Network (CAQRN) project is hosted on a Red Hat Enterprise Linux 8.10 high-performance computing (HPC) cluster.
Batch processing jobs are submitted from the CAQRN development and production servers to the cluster's compute nodes using orchestration scripts containing Slurm commands.

Developers submit test jobs from their sandbox environments on the development server to be run on the HPC cluster's compute nodes.

## Before you begin

In this tutorial, you'll add a simple logging feature to the CAQRN system, and install a new dependency to the project.
You'll test the feature by submitting a job to be run on the HPC cluster's compute nodes from your sandbox environment.

### What you'll need

- A personal sandbox on the development server (refer to the Quickstart)
- Familiarity with Git
- Familiarity with Python virtual environments

### What you'll learn

- How your sandbox environment works
- How dependencies for the project are managed
- How jobs are submitted from your sandbox to the HPC cluster

## 1. Set up your environment

To add the logging feature, you need to modify an existing file in the codebase.

1. Log in to the CAQRN development server (`caqrn-dev`).

2. Navigate to the code repo in your sandbox:

```bash
cd ~/caqrn-sandbox/code/caqrn-processing
```

The `onboarding` branch contains code specific to this tutorial.

3. Check out the `onboarding` branch from the remote repository:

```bash
git checkout -b onboarding origin/onboarding
```

4. Create and switch to your own feature branch:

```bash
git checkout -b feature/add-environment-logging
```

It's a good idea to isolate work to feature branches using descriptive names like `feature/update-aqi-algorithm` or `bugfix/fix-filename-regex`.
In normal development, you'll create feature branches from the `develop` branch and submit merge requests through the GitLab web interface.

5. Source the sandbox environment script:

```bash
source scripts/sandbox_env.sh
```

Notice that your command prompt now shows the name of your activated Python virtual environment.
The sandbox script activates your Python virtual environment, and sets environment variables used during job submission and execution.

6. Verify that the script set up your environment by checking a few key variables:

```bash
echo "Python virtual environment: $VIRTUAL_ENV"
echo "Code root: $CAQRN_CODE_ROOT"  
echo "Data root: $CAQRN_DATA_ROOT"
```

You should see output similar to:

```
Python virtual environment: /home/molina/caqrn-sandbox/venv
Code root: /home/molina/caqrn-sandbox/code
Data root: /home/molina/caqrn-sandbox/data
```

## 2. Manage project dependencies using pip

The logging feature you're adding will print environment information about the test job you'll be submitting.
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
cd ~/caqrn-sandbox/code/caqrn-processing/caqrn_processor
```

2. Open the `log_utils.py` file in your preferred editor:

```bash
vim log_utils.py
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
squeue -u molina
```

The output shows your job details.
Notice that settings such as the compute partition and number of compute nodes for the job are set by the job submission script:

```
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
12345 compute-d molina_t   molina  R       2:34      4 node[01-04]
```

3. Navigate to your Slurm log directory:

```bash
cd ~/caqrn-sandbox/logs/slurm
```

4. Find the log file for your test job, which includes your username and the job ID:

```bash
ls molina_test_daily_*
```

You should see a file like `molina_test_daily_20250101_12345.out`.

5. Monitor job progress by following the log file:

```bash
tail -f molina_test_daily_20250101_12345.out
```

The daily processing job can take up to 30 minutes to complete.
Now is a good time for a coffee break!

Your logging function will be called toward the end of execution.

6. When the job completes, you should see your environment table in the log output:

```
+---------------------+------------------------------------------+
| Variable            | Value                                    |
+=====================+==========================================+
| Virtual environment | /home/molina/caqrn-sandbox/venv          |
| Code root path      | /home/molina/caqrn-sandbox/code          |
| Data root path      | /home/molina/caqrn-sandbox/data          |
| Input data path     | /caqrn/data/incoming                     |
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

You should see the two daily files, which were created using the development server's shared sensor data at `/caqrn/data/incoming`:

```
caqrn_regional_aqi_20250101.nc
caqrn_pollutant_concentrations_20250101.nc
```

## Conclusion

This tutorial introduced you to the basic workflow for developing and testing features on the HPC architecture.
In normal development, you'll create feature branches from the `develop` branch, test locally using unit tests, and submit test jobs when needed using what you learned here.

### Summary

- Source `sandbox_env.sh` to set up your environment and activate your Python virtual environment.
- Use `pip freeze` to add a new Python package to the project's `requirements.txt`.
- Use `submit_daily_job.sh` to submit test jobs that run with your sandbox environment context.

### Learn more

- For more information on project environment variables, see the sandbox environment variable reference.
