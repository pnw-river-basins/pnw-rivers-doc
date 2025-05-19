#!/usr/bin/env Rscript
# Minimal pipeline stub: read demo data, summarise, save output

# ---- Setup: Load or install packages -------------------------
if (!requireNamespace("librarian", quietly = TRUE)) {
  install.packages("librarian", repos = "https://cloud.r-project.org")
}
librarian::shelf(
  tidyverse,
  quietly = TRUE,
  character.only = TRUE
)

# ---- Paths ---------------------------------------------------
input  <- "1-doc-paths-knowledge-base/datasets/raw-data/demo/data/demo-data.csv"
output <- "2-doc-paths-analytical-engine/data/test/summary_stats.csv"
dir.create(dirname(output), recursive = TRUE, showWarnings = FALSE)

# ---- Load ----------------------------------------------------
df <- read_csv(input, show_col_types = FALSE)

# ---- Summarise ----------------------------------------------
summary_tbl <- df %>% 
  summarise(
    n_obs      = n(),
    mean_DOC   = mean(doc.mg_l, na.rm = TRUE),
    mean_DSi   = mean(slc.mg_l, na.rm = TRUE)
  )

# ---- Save ----------------------------------------------------
write_csv(summary_tbl, output)
cat("✅  Summary written to", output, "\n")
