CREATE OR REPLACE VIEW `olist-analytics-497811.dataset.vw_customer_segment` AS
SELECT
  customer_unique_id,
  customer_state,
  first_purchase_date,
  last_purchase_date,
  total_orders,
  total_revenue,
  avg_order_value,
  avg_review_score,

  CASE
    -- Top-value repeat customers
    WHEN total_orders >= 2
      AND total_revenue >= 250
      AND avg_review_score >= 4
    THEN 'Champions'

    -- Repeat buyers
    WHEN total_orders >= 2
    THEN 'Loyal Customers'

    -- High-value one-time buyers
    WHEN total_orders = 1
      AND total_revenue >= 250
    THEN 'Potential Loyalists'

    -- One-time low satisfaction
    WHEN total_orders = 1
      AND avg_review_score <= 3
    THEN 'At Risk'

    ELSE 'Others'
  END AS segment

FROM `olist-analytics-497811.dataset.customer_master`;