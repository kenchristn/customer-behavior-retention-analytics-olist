-- ====================================================
-- Customer Master Table
-- Customer-level dataset for behavior & retention analysis
-- ====================================================

CREATE OR REPLACE TABLE
`olist-analytics-497811.dataset.customer_master` AS

WITH order_revenue AS (

  SELECT
    order_id,
    SUM(payment_value) AS total_order_value
  FROM `olist-analytics-497811.dataset.order_payments`
  GROUP BY order_id

),

review_score AS (

  SELECT
    order_id,
    AVG(review_score) AS avg_review_score
  FROM `olist-analytics-497811.dataset.order_reviews`
  GROUP BY order_id

),

base_orders AS (

  SELECT
    c.customer_unique_id,
    c.customer_state,
    o.order_id,
    DATE(o.order_purchase_timestamp) AS purchase_date,
    r.total_order_value,
    rv.avg_review_score

  FROM `olist-analytics-497811.dataset.orders` o

  JOIN `olist-analytics-497811.dataset.customers` c
    ON o.customer_id = c.customer_id

  LEFT JOIN order_revenue r
    ON o.order_id = r.order_id

  LEFT JOIN review_score rv
    ON o.order_id = rv.order_id

  WHERE o.order_status = 'delivered'

)

SELECT
  customer_unique_id,
  customer_state,

  MIN(purchase_date) AS first_purchase_date,
  MAX(purchase_date) AS last_purchase_date,

  COUNT(DISTINCT order_id) AS total_orders,

  ROUND(SUM(total_order_value), 2) AS total_revenue,

  ROUND(AVG(total_order_value), 2) AS avg_order_value,

  ROUND(AVG(avg_review_score), 2) AS avg_review_score

FROM base_orders

GROUP BY
  customer_unique_id,
  customer_state;