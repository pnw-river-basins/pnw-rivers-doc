# 🧭 Project Setup Summary: Containerizing an R Project with Docker

## 📌 Goal
Set up a **sandbox repository** for reproducible analysis using Docker and R, with the purpose of learning and applying containerization for future projects.

---

## ✅ Steps Followed

### 1. **Repository + Folder Structure**
- Created a new GitHub repository: `pnw-rivers-doc`
- Adopted a **consistent naming convention**:
  - **Hyphens** (`-`) for human-facing folder names (e.g., `2-doc-dsi-analytical-engine`)
  - **Underscores** (`_`) for machine-facing items (e.g., `summary_stats`)
- Populated the following folders:
  - `1-doc-paths-knowledge-base/` → raw data, metadata
  - `2-doc-dsi-analytical-engine/` → scripts, outputs, tests
  - `docker/` → container configuration

---

### 2. **Docker Container Setup**
- Created a `docker/Dockerfile` using `rocker/r-ver:4.5.0`
- Installed system dependencies (e.g., `libcurl`, `libssl`, `make`)
- Set up container to:
  - Mount the local repo as `/workspace`
  - Restore R packages using `renv::restore()` (if `renv.lock` exists)
- Successfully built the Docker image:

```bash
docker build -t pnw-rivers-doc -f docker/Dockerfile .
```

---

### 3. **Minimal Analysis Pipeline**
- Created a demo dataset:  
  `1-doc-paths-knowledge-base/datasets/raw-data/demo/demo_data.csv`
- Created a working pipeline script:  
  `2-doc-dsi-analytical-engine/scripts/run_all.R`
- Used `librarian::shelf()` to robustly load/install packages
- Verified the pipeline:
  - Reads the demo data
  - Summarizes it
  - Writes output to `2-doc-dsi-analytical-engine/data/summary_stats.csv`

---

### 4. **Testing Inside Docker**
Launched the container:

```bash
docker run --rm -it -v "$(pwd)":/workspace pnw-rivers-doc bash
```

Then inside the container:

```bash
Rscript 2-doc-dsi-analytical-engine/scripts/run_all.R
```

✅ Output confirmed: `summary_stats.csv` was generated successfully.

---

### 5. **Reproducibility + Clean-Up**
- Ran `renv::snapshot()` to track package versions
- Created a `.dockerignore` file to exclude unnecessary files (e.g., `.DS_Store`, raw data folders)
- Created/updated `.gitignore` to match
- Committed all relevant files using GitHub Desktop

---

## 📝 Key Takeaways

- ✅ Docker allows fully isolated and reproducible environments
- ✅ Consistent naming conventions prevent errors and improve usability
- ✅ Starting small (one script, one dataset) is a great way to test your build
- ✅ `librarian::shelf()` helps automate package installation and loading
- ✅ You only need to snapshot once you have a working set of packages

---

## ⏳ Deferred Tasks
- 🧪 Add validation tests after more of the real analysis is developed
- 📦 Convert to template repo once folder structure and workflow are fully populated
- 🧼 Maintain folder naming consistency and documentation as project evolves
