#!/bin/bash
# CAQRN Production environment script

# Activate the Python virtual environment
source /projects/caqrn/production/venv/bin/activate

# Environment
export CAQRN_ENV="production"
export CAQRN_CODE_ROOT="/projects/caqrn/production/code"
export CAQRN_CONFIG_PATH="/projects/caqrn/production/code/caqrn-config/prod"
export CAQRN_DATA_ROOT="/projects/caqrn/production/data"
export CAQRN_LOG_ROOT="/projects/caqrn/production/logs"

# Data paths
export CAQRN_INCOMING_DATA="/projects/caqrn/production/data/incoming"
export CAQRN_TEMP_DIR="/projects/caqrn/production/data/processing"

# Slurm settings
export CAQRN_SLURM_PARTITION="standard"
export CAQRN_SLURM_ACCOUNT="caqrn"
export CAQRN_JOB_PREFIX="prod_"

# Add project to PYTHONPATH
export PYTHONPATH="$CAQRN_CODE_ROOT/caqrn-processing:$PYTHONPATH"
