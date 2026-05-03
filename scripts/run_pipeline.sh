#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

MODE="${1:-script}"

case "$MODE" in
  script)
    python3 src/Demo-Visualization-Cleaning.py
    ;;
  notebook)
    jupyter nbconvert --to notebook --execute src/Demo-Visualization-Cleaning.ipynb --output executed-Demo-Visualization-Cleaning.ipynb
    ;;
  *)
    echo "Unknown mode: $MODE"
    echo "Usage: ./scripts/run_pipeline.sh [script|notebook]"
    exit 1
    ;;
esac
