-- ====================================================
-- Monthly Returning Customer Trend
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
    MIN(purchase_month) AS first_purchase_month
  FROM customer_orders
  GROUP BY customer_unique_id

)

SELECT
  co.purchase_month,

  COUNT(DISTINCT co.customer_unique_id)
    AS active_customers,

  COUNT(
    DISTINCT CASE
      WHEN co.purchase_month > fp.first_purchase_month
      THEN co.customer_unique_id
    END
  ) AS returning_customers,

  ROUND(
    COUNT(
      DISTINCT CASE
        WHEN co.purchase_month > fp.first_purchase_month
        THEN co.customer_unique_id
      END
    )
    / COUNT(DISTINCT co.customer_unique_id) * 100,
    2
  ) AS returning_customer_rate_pct

FROM customer_orders co

JOIN first_purchase fp
  ON co.customer_unique_id = fp.customer_unique_id

GROUP BY co.purchase_month

ORDER BY co.purchase_month;