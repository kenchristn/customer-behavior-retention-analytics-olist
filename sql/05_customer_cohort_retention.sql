-- ====================================================
-- Customer Cohort Retention
-- ====================================================

WITH customer_orders AS (

  SELECT
    c.customer_unique_id,

    DATE_TRUNC(
      DATE(o.order_purchase_timestamp),
      MONTH
    ) AS purchase_month

  FROM `olist-analytics-497811.dataset.orders` o

  JOIN `olist-analytics-497811.dataset.customers` c
    ON o.customer_id = c.customer_id

  WHERE o.order_status = 'delivered'

),

first_purchase AS (

  SELECT
    customer_unique_id,
    MIN(purchase_month) AS cohort_month
  FROM customer_orders
  GROUP BY customer_unique_id

),

cohort_data AS (

  SELECT
    fp.cohort_month,
    co.purchase_month,

    DATE_DIFF(
      co.purchase_month,
      fp.cohort_month,
      MONTH
    ) AS cohort_index,

    co.customer_unique_id

  FROM customer_orders co

  JOIN first_purchase fp
    ON co.customer_unique_id = fp.customer_unique_id

)

SELECT
  cohort_month,
  cohort_index,

  COUNT(DISTINCT customer_unique_id)
    AS total_customers

FROM cohort_data

GROUP BY
  cohort_month,
  cohort_index

ORDER BY
  cohort_month,
  cohort_index;