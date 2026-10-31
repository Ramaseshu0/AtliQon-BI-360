-- Watermark check: latest loaded date in the gold fact table.
SELECT MAX(`date`) AS max_date
FROM `fmcg`.`gold`.`fact_orders`
