#!/usr/bin/env bash

set -euo pipefail

EVENT_FILE="./data/events_of_interest.txt"
IOE="./data/selected_events.ioe"
PSI1="./data/selected_psi_condition1.txt"
PSI2="./data/selected_psi_condition2.txt"
DPSI="./data/selected_dpsi.txt"
GTF="./data/reference.gtf"
COND1="Cond1"
COND2="Cond2"
OUTDIR="./event_plots/"

while IFS= read -r EVENT_ID; do

# skip blank lines
[[ -z "${EVENT_ID}" ]] && continue

echo "Processing: ${EVENT_ID}"

Rscript ./scripts/Splciing_visualisation.R \
--ioe "${IOE}" \
--psi1 "${PSI1}" \
--psi2 "${PSI2}" \
--dpsi "${DPSI}" \
--gtf "${GTF}" \
--cond1 "${COND1}" \
--cond2 "${COND2}" \
-t "\"${EVENT_ID}\"" \
--outdir "${OUTDIR}" \

done < "${EVENT_FILE}"

echo "All events processed."