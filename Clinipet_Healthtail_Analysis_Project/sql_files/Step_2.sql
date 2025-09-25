  /*
Healthtail Questions
1. What med did we spend the most money on in total?
2. What med had the highest monthly total_value spent on patients? At what month? 
3. What month was the highest in packs of meds spent in vet clinic?
4. What’s an average monthly spent in packs of the med that generated the most revenue? 
*/

-- Q1 = What med did we spend the most money on in total? 
-- Answer = Vetmedin (Pimobendan) 87120.0
SELECT
  med_name,
  total_value,
FROM
  `advance-analytics-lab-bianca.clinipet_integration_table.healthtail_med_audit`
WHERE stock_movement = 'stock_in'
ORDER BY total_value DESC
LIMIT 1;

-- Q2 = What med had the highest monthly total_value spent on patients? At what month? 
-- Answer
SELECT
  med_name,
  total_value,
FROM
  `advance-analytics-lab-bianca.clinipet_integration_table.healthtail_med_audit`
WHERE stock_movement = 'stock_in'
ORDER BY total_value DESC
LIMIT 1

-- Q3 = What month was the highest in packs of meds spent in vet clinic?
-- Answer = 2024-12-01 with amount of 3861.62
SELECT
  month,
  SUM(total_packs) AS total_packs
FROM
  `advance-analytics-lab-bianca.clinipet_integration_table.healthtail_med_audit`
WHERE
  stock_movement = 'stock_out'
GROUP BY
  month
ORDER BY
  total_packs DESC
LIMIT 1;

-- Q4 = What’s an average monthly spent in packs of the med that generated the most revenue? 
-- Answer = Palladia (Toceranib Phosphate) 52.54

 WITH most_spent AS (
  SELECT 
    med_name,
    SUM(total_value) AS total_value
  FROM 
    `advance-analytics-lab-bianca.clinipet_integration_table.healthtail_med_audit`
    where stock_movement='stock_out'
  GROUP BY 
    med_name
  ORDER BY 
     total_value DESC
  LIMIT 1
)
SELECT 
  ma.med_name,
  AVG(total_packs) AS avg_monthly_packs
FROM 
  `advance-analytics-lab-bianca.clinipet_integration_table.healthtail_med_audit` AS ma
JOIN 
  most_spent AS mrm
ON 
  ma.med_name = mrm.med_name
WHERE 
  ma.stock_movement = 'stock_out'
GROUP BY 
  ma.med_name


