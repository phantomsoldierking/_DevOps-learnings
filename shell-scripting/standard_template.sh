#!/bin/bash
set -e  # Exit on error
set -u  # Treat unset variables as an error
set -o pipefail  # Catch pipeline errors

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $1"
}

log "Script started"

# Your commands here

log "Script completed"
