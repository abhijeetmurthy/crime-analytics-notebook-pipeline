#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

MODE="${1:-script}"

case "$MODE" in
  script)
    if ! python3 - <<'PY'
import importlib.util
import sys
required = ["pandas", "numpy"]
missing = [pkg for pkg in required if importlib.util.find_spec(pkg) is None]
if missing:
    print("Missing Python package(s): " + ", ".join(missing))
    print("Install with: python3 -m pip install -r requirements.txt")
    sys.exit(1)
PY
    then
      exit 1
    fi
    shift || true
    python3 src/pipeline_clean.py "$@"
    ;;
  notebook)
    if ! command -v jupyter >/dev/null 2>&1; then
      echo "jupyter not found. Install with: python3 -m pip install -r requirements.txt"
      exit 1
    fi
    jupyter nbconvert --to notebook --execute src/Demo-Visualization-Cleaning.ipynb --output executed-Demo-Visualization-Cleaning.ipynb
    ;;
  *)
    echo "Unknown mode: $MODE"
    echo "Usage: ./scripts/run_pipeline.sh [script|notebook]"
    exit 1
    ;;
esac
