#!/bin/bash
# CAQRN Sandbox environment script
# Deployed code environment would look similar to this

# Activate the python virtual environmnemt
source "$HOME/caqrn-sandbox/venv/bin/activate"

# Paths used by scripts / main app; these ppoint to the sandbox env
export CAQRN_ENV="development"
export CAQRN_CODE_ROOT="$HOME/caqrn-sandbox/code"
export CAQRN_CONFIG_PATH="$HOME/caqrn-sandbox/code/caqrn-config/dev"
export CAQRN_DATA_ROOT="$HOME/caqrn-sandbox/data"
export CAQRN_LOG_ROOT="$HOME/caqrn-sandbox/logs"

# Shared / non-sandbox data paths
# Developers use data pulled in by the dev server's scheduled downloads
export CAQRN_INCOMING_DATA="/caqrn-dev/data/incoming"
export CAQRN_TEMP_DIR="/caqrn-dev/temp"

# SLURM settings
# Use same account as scheduled dev runs
# Use the development partition
# Add user name to a prefix used in submission scripts
export CAQRN_SLURM_PARTITION="dev"
export CAQRN_SLURM_ACCOUNT="caqrn-dev"
export CAQRN_JOB_PREFIX="${USER}_test_"

# Add project to PYTHONPATH
export PYTHONPATH="$CAQRN_CODE_ROOT/caqrn-processing:$PYTHONPATH"
