#!/bin/bash
# submit_daily_job.sh - job submission script
# This is the wrapper script that would be on the project's scrontab
# Also used by developers to manually submit test jobs to the compute nodes

DATE=${1:-$(date +%Y%m%d)}
JOB_NAME="${CAQRN_JOB_PREFIX}daily_${DATE}"

# set up a working directory
WORKING_DIR="${CAQRN_DATA_ROOT}/processing/${JOB_NAME}"
mkdir -p "$WORKING_DIR"

# submit the job to Slurm job queue
# export all of the user's environment variables to the compute node job
# give the Slurm job script the date and working dir
sbatch \
    --job-name="$JOB_NAME" \
    --partition="$CAQRN_SLURM_PARTITION" \
    --account="$CAQRN_SLURM_ACCOUNT" \
    --output="${CAQRN_LOG_ROOT}/slurm/%x_%j.out" \
    --error="${CAQRN_LOG_ROOT}/slurm/%x_%j.err" \
    --export=ALL \ 
    "${CAQRN_CODE_ROOT}/caqrn-processing/scripts/processing_job.sh" \
    "$DATE" "$WORKING_DIR"
