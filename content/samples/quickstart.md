---
date: '2025-07-08T15:59:14-05:00'
draft: true
title: 'Quickstart'
linkTitle: 'Quickstart'
type: 'docs'
weight: 5
---

Set up your sandbox on the Coastal Air Quality Research Network (CAQRN) development server in under 10 minutes.

## What you'll set up

A personal sandbox environment for developing, testing, and running HPC jobs.
You'll set up directories, clone repositories, and create an isolated Python environment.

## Prerequisites

Before you start, you'll need:

- Access to the CAQRN development server
- Python 3.9 installed
- Git configured with access to `gitlab.caqrn.internal`

## Create your workspace

Set up the project directory structure.

```bash
cd ~
mkdir -p caqrn-sandbox/{code,data,logs}
mkdir -p caqrn-sandbox/data/{processing,products}
mkdir -p caqrn-sandbox/logs/{processing,slurm}
```

These directories will store your sandbox code, outputs, and logs.
You'll test your sandbox code with shared data located outside of this workspace.

## Clone the project repositories

Clone the project's code and configuration repositories.

```bash
cd ~/caqrn-sandbox/code
git clone git@gitlab.caqrn.internal:caqrn/caqrn-processing.git
git clone git@gitlab.caqrn.internal:caqrn/caqrn-config.git
```

## Create a Python virtual environment

Create an isolated Python environment for your sandbox dependencies.

```bash
cd ~/caqrn-sandbox
python3.9 -m venv venv
```

Use this exact location and name - it's referenced in the sandbox environment script you'll source in the next step.

## Source the sandbox environment

Source the sandbox environment script in the project repository.

```bash
source ~/caqrn-sandbox/code/caqrn-processing/scripts/sandbox_env.sh
```

This script activates your Python virtual environment, and sets all of the environment variables necessary for testing your sandbox code, including setting paths to shared resources and credentials.

## Install dependencies

Confirm you're on the develop branch before installing dependencies.

```bash
cd ~/caqrn-sandbox/code/caqrn-processing
git branch  # Should show "develop" as current branch
```

Install dependencies using the requirements.txt file.

```bash
pip install -r requirements.txt
```

## You're all set

You now have an isolated sandbox where you can make code changes, install and update dependencies, and test using live data shared on the development server.

## Next steps

- 
