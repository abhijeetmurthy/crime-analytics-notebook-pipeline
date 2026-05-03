# Crime Analytics Notebook Pipeline

Generic notebook-first analytics pipeline for scraping, cleaning, and visualizing structured incident data.

## Pipeline Stages

1. Ingest: collect raw records (web scraping + CSV ingest).
2. Clean: normalize fields and produce analysis-ready tabular output.
3. Analyze: run exploratory analysis notebooks.
4. Visualize: generate charts and summary images.
5. Report: export notebook outputs for presentation.

## Repository Layout

- `data/`: raw and cleaned datasets.
- `src/`: notebooks and helper scripts.
- `visualisation/`: generated and curated chart images.

## Example Datasets (Current)

- `data/raw.csv`
- `data/Cleaned.csv`

## Notebook Examples (Current)

- `src/WebScraping-Demo.ipynb`
- `src/Demo-Visualization-Cleaning.ipynb`
- `src/main.py.ipynb`

## Script Example

- `src/Demo-Visualization-Cleaning.py`
