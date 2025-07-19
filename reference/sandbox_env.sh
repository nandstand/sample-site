#!/bin/bash
# CAQRN Sandbox environment script

# Activate the Python virtual environmnemt
source "$HOME/caqrn-sandbox/venv/bin/activate"

# Environment
export CAQRN_ENV="development"
export CAQRN_CODE_ROOT="$HOME/caqrn-sandbox/code"
export CAQRN_CONFIG_PATH="$HOME/caqrn-sandbox/code/caqrn-config/dev"
export CAQRN_DATA_ROOT="$HOME/caqrn-sandbox/data"
export CAQRN_LOG_ROOT="$HOME/caqrn-sandbox/logs"
export CAQRN_TEMP_DIR="$HOME/caqrn-sandbox/data/processing"

# Data paths
export CAQRN_INCOMING_DATA="/projects/caqrn/shared/data/incoming"

# Slurm settings
export CAQRN_SLURM_PARTITION="dev"
export CAQRN_SLURM_ACCOUNT="caqrn-dev"
export CAQRN_JOB_PREFIX="${USER}_test_"

# Add project to PYTHONPATH
export PYTHONPATH="$CAQRN_CODE_ROOT/caqrn-processing:$PYTHONPATH"
