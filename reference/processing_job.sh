#!/bin/bash
# processing_job.sh - SLURM job script
# this is the script that would serve as the entry point for the SLURM job

# SLURM directives

#SBATCH --time=04:00:00
#SBATCH --nodes=4
#SBATCH --tasks-per-node=8

PROCESSING_DATE=$1
WORKING_DIR=$2

# Pythonn environment needs to be reactivated on the compute node
# Check environment and activate the venv

if [[ "$CAQRN_ENV" == "production" ]]; then
    # Main branch deployment
    source /projects/caqrn/production/venv/bin/activate
elif [[ "$CAQRN_ENV" == "staging" ]]; then
    # Develop branch deployment
    source /projects/caqrn/develop/venv/bin/activate
else
    # Active development job | CAQRN_ENV == development
    source "$HOME/caqrn-sandbox/venv/bin/activate"
fi

# These are set up in the environment script and passed in explicitly
# by the submission script
INPUT_DIR="${CAQRN_INCOMING_DATA}/$(date -d $PROCESSING_DATE +%Y/%m/%d)"
OUTPUT_DIR="${CAQRN_DATA_ROOT}/products/$(date -d $PROCESSING_DATE +%Y/%m/%d)"

mkdir -p "$OUTPUT_DIR"
cd "$WORKING_DIR"

# Processing would look something like this
python -m caqrn_processor.main \
    --input-dir "$INPUT_DIR" \
    --output-dir "$OUTPUT_DIR" \
    --config "${CAQRN_CONFIG_PATH}/processing.yaml" \
    --date "$PROCESSING_DATE"
