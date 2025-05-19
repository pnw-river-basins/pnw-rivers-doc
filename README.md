# pnw-rivers-doc
# DOC–DSi Flowpath Dynamics

## Overview

This repository underpins the manuscript **“Silica and Dissolved Organic Carbon Trace Structural Shifts in Watershed Flowpaths”** (working title).  We explore how 35 years of dissolved organic carbon (DOC) and dissolved silica (DSi) records across ten H.J. Andrews headwater catchments reveal long‑term re‑routing of hydrologic connectivity after forest disturbance.

## Manuscript snapshot

* **Study sites** – Paired reference (WS09) and disturbed (WS10) watersheds plus eight comparative basins spanning lithologic and treatment gradients.
* **Key findings (early)**

  * Disturbance flattens DOC seasonality and suppresses long‑term concentrations.
  * DOC–DSi *seasonal cycles* (3‑week resolution) rotate in opposite directions between control and treatment basins, marking altered source‑zone dominance.
* **Methods** – Empirical DOC model (R² > 0.8), seasonal cycle analysis, long‑term trend decomposition.

---

## Repository layout

Below is the canonical structure we use in all projects.  We follow a naming convention where **hyphens ( - )** are used for **human-facing** folder names and **underscores ( _ )** are used for **machine facing** items such as code variables and internal references. The project short‑name here is **`doc-pathsi`** – just insert it between the numeral and folder label.

```text
project-repo/
├── 1-doc-paths-knowledge-base/         # Raw data, metadata, provenance
│   └── 0-doc-paths-NADDER/              # Obsidian vault companion for project narrative
│   └── datasets/
│       └── raw-data/
│           └── [dataset-name]/
│               ├── data/               # Original files (not tracked – use LFS)
│               ├── metadata/           # Dictionaries, citations, README.txt
│               ├── scripts/            # Retrieval / cleanup helpers
│               └── README.txt
│
├── 2-doc-dsi-analytical-engine/        # Functions, scripts, tests, notebooks
│   ├── source/                         # Reusable R functions
│   ├── scripts/                        # One-off processing steps
│   ├── tests/                          # Lightweight unit tests
│   ├── data/                           # Intermediate inputs / outputs
│   ├── notebooks/                      # Quarto notebooks for QA / viz
│   └── README.md                       # Describes analytical logic
│
├── 3-doc-dsi-production-hub/           # Draft reports, structured summaries
├── 4-doc-dsi-product-store/            # Camera-ready figures, tables, manuscripts
├── 5-doc-dsi-user-engagement/          # Quarto sites, slides, dashboards
│
├── .gitignore                          # Excludes large/raw data, temp files
├── renv.lock                           # Tracks R environment (R 4.5.0)
├── docker/Dockerfile                   # Reproducible analysis container
└── README.md                           # You’re reading it
```

---

## Quick start

```bash
# Clone and enter
$ git clone https://github.com/<org>/<repo>.git
$ cd <repo>

# Build the container (uses R 4.5.0 base image)
$ docker build -t doc-dsi -f docker/Dockerfile .

# Launch an interactive session with repo mounted
$ docker run --rm -it -v $(pwd):/workspace doc-dsi bash

# Reproduce the full analysis (inside container)
$ Rscript 2-doc-dsi-analytical-engine/scripts/run_all.R
```

### Running locally (optional)

Restore the exact package versions with:

```r
renv::restore()
```

Requires **R 4.5.0**.

## Dependencies

* **Core R packages** – tidyverse, data.table, lubridate, ggplot2, targets
* **System** – Docker ≥ 24

## Contributing

This repo doubles as a containerization learning sandbox.  PRs that improve reproducibility, documentation, or workflow ergonomics are welcome.

## License

MIT – see `LICENSE`.

---

*Maintainer note: README will evolve alongside manuscript progress and image build refinements.*

