#!/bin/bash
# submit_daily_job.sh - job submission script
# This is the job that would be called from the service account's cron

DATE=${1:-$(date +%Y%m%d)}
JOB_NAME="${CAQRN_JOB_PREFIX}daily_${DATE}"

# set up a working directory
WORKING_DIR="${CAQRN_DATA_ROOT}/processing/${JOB_NAME}"
mkdir -p "$WORKING_DIR"

# submit the job to SLURM queue
# export all of the user's environment variables to the compute node job
# give the SLURM job wrapper the date and working dir
sbatch \
    --job-name="$JOB_NAME" \
    --partition="$CAQRN_SLURM_PARTITION" \
    --account="$CAQRN_SLURM_ACCOUNT" \
    --output="${CAQRN_LOG_ROOT}/slurm/%x_%j.out" \
    --error="${CAQRN_LOG_ROOT}/slurm/%x_%j.err" \
    --export=ALL \ 
    "${CAQRN_CODE_ROOT}/caqrn-processing/scripts/processing_job.sh" \
    "$DATE" "$WORKING_DIR"
