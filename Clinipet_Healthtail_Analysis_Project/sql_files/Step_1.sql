  /* 
Clean the data
1) breed - Replace Nulls with 'Unknown'
2) owner_name - Remove 'Mr.' and 'Mrs.' from start of names to create consistency
3) patient_name - Fix so that all lower case and word is capitalized
4) owner_phone - Remove non numeric data
Save new table healthtail_reg_cards_clean
*/
SELECT
  patient_id,
  owner_id,
  REPLACE(REPLACE(owner_name, 'Mr.', ''), 'Mrs.', '') AS owner_name,
  pet_type,
  IFNULL(breed, 'Unknown') AS breed,
  INITCAP(LOWER(patient_name)) AS patient_name,
  gender,
  patient_age,
  date_registration,
  REGEXP_REPLACE(owner_phone, r'[^0-9]', '') owner_phone
FROM
  `advance-analytics-lab-bianca.clinipet_stage_tables.healthtail_reg_cards`;

/*
Aggregate the cleaned table
- track movement of meds (stock-in or stock-out when used in procedures)
- have following columns: month, med_name, total_packs, total_value, stock_movement
1)Create query to aggregate meds recd monthly, use SUM(total_price) for total_value and assign 'stock in' to stock_movement column
2)Create query to aggreagte meds spent monthly, use SUM(med_dosage) for total_packs and SUM(med_cost) for total_value and assign 'stock out' to stock_movement column
3)Apply union to combine both queries, make sure both tables have same num cols and matching data formats before uniting
4)Save to new table called healthtail_med_audit
*/

WITH stock_in_table AS (
  SELECT 
    DATE_TRUNC(month_invoice, MONTH) AS month,
    med_name,
    ROUND(SUM(packs),2) AS total_packs,
    ROUND(SUM(total_price),2) AS total_value,
    "stock_in" AS stock_movement
  FROM `advance-analytics-lab-bianca.clinipet_stage_tables.healthtail_invoices`
  GROUP BY month, med_name
),
stock_out_table AS(
  SELECT 
    DATE_TRUNC(visit_datetime, MONTH) AS month,
    med_prescribed AS med_name,
    ROUND(SUM(med_dosage),2) AS total_packs,
    ROUND(SUM(med_cost),2) AS total_value,
    "stock_out" AS stock_movement
  FROM `advance-analytics-lab-bianca.clinipet_stage_tables.healthtail_visits`
  GROUP BY month, med_name
)
SELECT *
FROM stock_in_table
UNION ALL 
SELECT *
FROM stock_out_table
ORDER BY month







