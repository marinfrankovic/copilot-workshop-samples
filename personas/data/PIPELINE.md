# Data Engineer track — ETL pipeline, then query the result

**Goal:** turn three messy CSV exports into one clean table, then immediately
**query** it with SQL — without hand-writing the pipeline. You describe each
step; Copilot writes it; you run and check.

## Files (deliberately messy, like real exports)
- `sales_january.csv` — `$` signs, commas inside numbers (`$1,188.00`), mixed-case names/regions, trailing spaces.
- `sales_february.csv` — **different column names** (`date,rep,region,product,units,revenue`) and a **different date format** (`MM/DD/YYYY`).
- `product_prices.csv` — clean list-price lookup table to join on.

## The pipeline you'll build (Extract → Transform → Load → Query)
1. **Extract:** read all three CSVs.
2. **Transform:** normalise column names; strip `$` and commas from revenue; trim and title-case names; standardise region; parse both date formats to ISO.
3. **Load:** write a clean `sales_clean.csv` **and** load into an in-memory SQLite/DuckDB table — never overwrite the originals.
4. **Query:** run SQL immediately, e.g. revenue by region, top product, month-over-month.

## Short demo (the loop)
1. **Describe:** "Look at the 3 CSVs in this folder. List every difference and data-quality issue I must handle before merging."
2. **Generate:** "Write a Python script that extracts all three, normalises columns and the two date formats, cleans revenue to a number, and writes `sales_clean.csv`. Do not overwrite originals. Comment each step."
3. **Load + query:** "Load `sales_clean.csv` into an in-memory SQLite table and run a query for total revenue by region and by month. Print the results."
4. **Refine:** "Join `product_prices.csv` and add a `discount_vs_list` column (actual unit price vs list price)."
5. **Sanity-check:** "Print row count, date range, 3 sample rows, and total revenue before and after cleaning so I can trust it."

## Prompt starters
- "Validate that every revenue value parsed to a number; show me any rows that failed."
- "Give me one DuckDB query that ranks reps by total revenue per region."
- "Explain this pipeline in 5 bullets before I run it."

## Safety
- Write to **new** files only; keep the source CSVs untouched.
- Read the script before running it. Sanity-check the totals.
