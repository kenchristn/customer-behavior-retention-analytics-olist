-- ====================================================
-- Monthly Customer Acquisition Trend
-- ====================================================

SELECT
  DATE_TRUNC(first_purchase_date, MONTH) AS purchase_month,

  COUNT(*) AS new_customers,

  ROUND(SUM(total_revenue), 2) AS revenue_generated

FROM `olist-analytics-497811.dataset.customer_master`

GROUP BY purchase_month

ORDER BY purchase_month;