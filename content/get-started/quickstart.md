---
title: 'Quickstart'
linkTitle: 'Quickstart'
description: 'Set up your sandbox for development on the HPC cluster in under 10 minutes.'
type: 'docs'
weight: 5
---

{{% alert color="success" %}}

This writing sample covers a standard procedure for setting up a development environment.
It touches on common development topics like managing repositories with Git, and installing dependencies using Python virtual environments and pip.

Clear instructions for getting started on a project can make a world of difference.
Developers can usually figure out how to do these kinds of things on their own, but having a standard procedure can prevent headaches and confusion down the road.
It's easier to help someone who is just starting out if everyone is on the same page!

{{% /alert %}}

## What you'll set up

A personal sandbox environment for developing, testing, and running HPC jobs on the university's Zephyr cluster.
You'll set up directories, clone repositories, and create an isolated Python environment.

## Prerequisites

Before you start, you'll need:

- Access to a login node on the Zephyr cluster (`zephyr.login.coast-state.edu`)
- Python 3.9 installed
- Git configured with access to `gitlab.coast-state.edu`

## Create your workspace

Set up the project directory structure in your home directory on the login node:

```bash
cd ~
mkdir -p caqrn-sandbox/{code,data,logs}
mkdir -p caqrn-sandbox/data/{processing,products}
mkdir -p caqrn-sandbox/logs/{processing,slurm}
```

These directories will store your sandbox code, outputs, and logs.
You'll test your sandbox code with shared data located outside of this workspace.

## Clone the project repositories

Clone the project's code and configuration repositories:

```bash
cd ~/caqrn-sandbox/code
git clone git@gitlab.coast-state.edu:caqrn/caqrn-processing.git
git clone git@gitlab.coast-state.edu:caqrn/caqrn-config.git
```

After cloning, you'll have the following repository structures in your `code` directory:

{{< cardpane >}}
{{< card header="caqrn-processing" code=true lang="text" >}}
caqrn-processing/
├── src/
│   ├── __init__.py
│   ├── ingest.py
│   ├── processing.py
│   ├── utils.py
├── scripts/
│   ├── sandbox_env.sh
│   ├── production_env.sh
│   ├── staging_env.sh
│   ├── submit_daily_job.sh
│   └── processing_job.sh
├── requirements.txt
└── README.md
{{< /card >}}
{{< card header="caqrn-config" code=true lang="text" >}}
caqrn-config/
├── production/
│   ├── ingest.yml
│   ├── processing.yml
│   ├── system.yml
│   └── monitoring.yml
├── staging/
│   ├── ingest.yml
│   ├── processing.yml
│   ├── system.yml
│   └── monitoring.yml
├── docs/
│   └── deployment.md
└── README.md
{{< /card >}}
{{< /cardpane >}}

## Create a Python virtual environment

Create an isolated Python environment for your sandbox dependencies:

```bash
cd ~/caqrn-sandbox
python3.9 -m venv venv
```

Use this exact location and name - it's referenced in the sandbox environment script you'll source in the next step.

## Source the environment script

Source the sandbox environment script in the project repository:

```bash
source ~/caqrn-sandbox/code/caqrn-processing/scripts/sandbox_env.sh
```

This script activates your Python virtual environment, and sets all of the environment variables necessary for testing your sandbox code, including setting paths to shared resources and credentials.

## Install dependencies

Confirm you're on the develop branch before installing dependencies:

```bash
cd ~/caqrn-sandbox/code/caqrn-processing
git branch  # Should show "develop" as current branch
```

Install dependencies using the requirements.txt file:

```bash
pip install -r requirements.txt
```

## You're all set

You now have an isolated sandbox where you can make code changes, install and update dependencies, and test using sensor data shared on the cluster's filesystem.

## Next steps

- [Develop and test your first feature on the HPC cluster](/get-started/hpc-tutorial/)
