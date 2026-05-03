# Crime Analytics Notebook Pipeline

Enterprise-style notebook-centric analytics pipeline for ingestion, cleaning, and visualization.

## Structure
- `src/`: notebooks and transformation scripts.
- `data/`: raw/cleaned example datasets.
- `visualisation/`: generated chart outputs.
- `configs/`, `scripts/`, `docs/`: operational layers.

## Quickstart
```bash
./scripts/bootstrap.sh
./scripts/run_pipeline.sh script
```

## Run Modes
- `./scripts/run_pipeline.sh script`
- `./scripts/run_pipeline.sh notebook`

## Example Datasets and Notebooks
- `data/raw.csv`
- `data/Cleaned.csv`
- `src/WebScraping-Demo.ipynb`
- `src/Demo-Visualization-Cleaning.ipynb`
- `src/main.py.ipynb`
