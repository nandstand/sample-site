Project Deployment
---

## Slurm / partitions / compute nodes

- The project uses a public university HPC cluster where compute nodes are shared with other users
- The cluster has a variety of different partitions that are available to users
- The project would submit the "real" automated jobs to the general purpose partition (`standard`), and the developer sandbox / test jobs to a pared back, probably cheaper development queue (`dev`)
  - Source: https://www.sherlock.stanford.edu/docs/user-guide/running-jobs/#public-partitions
  - Source: https://hpcc.umd.edu/hpcc/help/queues.html
- The python virtual environments would be managed on the login nodes, then accessed by the compute nodes at job execution time
- Compute nodes have access to the same file system that login nodes do
  - Source: https://www.osc.edu/supercomputing/storage-environment-at-osc/storage-hardware/overview_of_file_systems
- Developers log into the login nodes and work from their sandbox environments
- Sample docs won't cover local tests, just test jobs submitted to Slurm

## Environment

- Environment scripts set up paths, activate python environment, and add project to PYTHONPATH
- Separate environment scripts for production, development, and for developers in their sandboxes
- Shared incoming data, developers use the dev data set for testing
- The deployed code uses a Python virtual environment (dev/main)
- Developers use a Python virtual environment in their sandboxes
- Have to activate on login
- Small team: just manage dependencies via requirements file / pip

## Storage / filesystem

- The CAQRN group project directory (the live code) would live under something like `/projects/caqrn/`.
- Providers offer storage areas specifically for this kind of thing
  - Source: https://hpcc.umd.edu/hpcc/help/storage.html
  - Source: https://documentation.sigma2.no/files_storage/clusters.html#project-area

## Python virtual environments / libraries on HPC infrastructure

- Python virtual environments allow developers to isolate and test new dependencies in a way that is easy to understand (and write about).
  - Source: https://docs.python.org/3/library/venv.html
- System dependencies on HPC clusters are often managed via things like the `module load` command to load modules already installed on the compute nodes 
  - Source: https://www.sherlock.stanford.edu/docs/user-guide/running-jobs/#example-sbatch-script
  - Source: https://www.carc.usc.edu/user-guides/advanced-hpc-programming/programming-languages/python
- Since this is just a sample project, and to keep things simple, we'll assume that it's allowed and feasible to activate a python virtual environment that lives on storage mounted to the login node, from the compute node.
  - This document suggests using pip to install in an HPC env: https://www.hpc.iastate.edu/guides/virtual-environments/python-virtual-environments
- We'll also omit the concept of managing modules on a public HPC to keep the scope of the samples more narrow.  Let's just assume we have the correct version of Python loaded on the login and compute nodes, and we don't need any compiled libraries
- Project Python dependencies managed via `pip` and updates to the project's `requirements.txt` file

## Scheduled jobs

- Daily automated submission of `develop` branch and `main` branch code
- Products would be archived and provided to whatever research groups the project serves
- Just one daily processing job and one set of data coming in for simplicity's sake
- Processing job is a long running job (a few hours)
- Downloaded data from the `develop` deployment would be accessible for developers to use in their sandbox job submissions
- Automated job submission would be done via `scrontab`, and that would likely be owned and managed by the same person that owns the deployment repos
  - Source: https://hpc.nmsu.edu/discovery/slurm/recurring-jobs/
