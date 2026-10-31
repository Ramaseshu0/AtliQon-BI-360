-- Incremental load: ingest new fact_orders rows from a volume-backed CSV
-- (the volume is backed by AWS S3 raw landing data).
COPY INTO fmcg.gold.fact_orders
FROM (
  SELECT 
    CAST(date AS DATE) AS date,
    product_code,
    customer_code,
    sold_quantity
  FROM '/Volumes/fmcg/gold/parent_incremental_update/fact_orders.csv'
)
FILEFORMAT = CSV
FORMAT_OPTIONS ('header' = 'true');
