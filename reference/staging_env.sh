#!/bin/bash
# CAQRN Staging environment script  

# Activate the python virtual environment
source /projects/caqrn/develop/venv/bin/activate

# Environment
export CAQRN_ENV="staging"
export CAQRN_CODE_ROOT="/projects/caqrn/develop/code"
export CAQRN_CONFIG_PATH="/projects/caqrn/develop/code/caqrn-config/dev"
export CAQRN_DATA_ROOT="/projects/caqrn/develop/data"
export CAQRN_LOG_ROOT="/projects/caqrn/develop/logs"

# Data paths
export CAQRN_INCOMING_DATA="/projects/caqrn/develop/data/incoming"
export CAQRN_TEMP_DIR="/projects/caqrn/develop/data/processing"

# SLURM settings
export CAQRN_SLURM_PARTITION="standard"
export CAQRN_SLURM_ACCOUNT="caqrn"
export CAQRN_JOB_PREFIX="staging_"

# Add project to PYTHONPATH
export PYTHONPATH="$CAQRN_CODE_ROOT/caqrn-processing:$PYTHONPATH"
