#!/bin/bash
# CAQRN Staging environment script  
# Used for scheduled staging jobs on develop branch deployment

# Activate the python virtual environment
source /projects/caqrn/develop/venv/bin/activate

# Environment identification
export CAQRN_ENV="staging"

# Paths used by scripts / main app; these point to the develop deployment
export CAQRN_CODE_ROOT="/projects/caqrn/develop/code"
export CAQRN_CONFIG_PATH="/projects/caqrn/develop/code/caqrn-config/dev"
export CAQRN_DATA_ROOT="/projects/caqrn/develop/data"
export CAQRN_LOG_ROOT="/projects/caqrn/develop/logs"

# Data paths
# Incoming data is shared
export CAQRN_INCOMING_DATA="/projects/caqrn/develop/data/incoming"
export CAQRN_TEMP_DIR="/projects/caqrn/develop/data/processing"

# SLURM settings
# Uses same partition and account as production
export CAQRN_SLURM_PARTITION="standard"
export CAQRN_SLURM_ACCOUNT="caqrn"
export CAQRN_JOB_PREFIX="staging_"

# Add project to PYTHONPATH
export PYTHONPATH="$CAQRN_CODE_ROOT/caqrn-processing:$PYTHONPATH"
