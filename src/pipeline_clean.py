#!/usr/bin/env python3
"""Vectorized cleaning pipeline for crime dataset examples."""

import argparse
from pathlib import Path

import pandas as pd


def clean_dataset(input_csv: Path, output_csv: Path) -> pd.DataFrame:
    df = pd.read_csv(input_csv, encoding="utf-8-sig")

    if "Unnamed: 0" in df.columns:
        df = df.drop(columns=["Unnamed: 0"])

    # Standardize string columns.
    object_cols = df.select_dtypes(include=["object"]).columns
    for col in object_cols:
        df[col] = df[col].astype(str).str.strip()

    # Coerce numeric columns safely and fill missing with median.
    numeric_candidates = [c for c in df.columns if c not in {"Area_Name", "Sub_Group_Name"}]
    for col in numeric_candidates:
        df[col] = pd.to_numeric(df[col], errors="coerce")
        if df[col].isna().any():
            df[col] = df[col].fillna(df[col].median())

    output_csv.parent.mkdir(parents=True, exist_ok=True)
    df.to_csv(output_csv, index=False)
    return df


def main() -> None:
    parser = argparse.ArgumentParser(description="Crime analytics cleaning pipeline")
    parser.add_argument("--input", default="data/raw.csv", help="Input CSV")
    parser.add_argument("--output", default="data/Cleaned.csv", help="Output CSV")
    args = parser.parse_args()

    cleaned = clean_dataset(Path(args.input), Path(args.output))
    print(f"Cleaned rows: {len(cleaned)} | columns: {len(cleaned.columns)}")
    print(f"Wrote cleaned dataset to: {args.output}")


if __name__ == "__main__":
    main()
