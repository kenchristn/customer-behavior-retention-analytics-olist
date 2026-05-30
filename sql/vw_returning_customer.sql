-- =========================================
-- View: Returning Customer Trend
-- =========================================

CREATE OR REPLACE VIEW
`olist-analytics-497811.dataset.vw_returning_customer`
AS

SELECT
  DATE_TRUNC(last_purchase_date, MONTH) AS purchase_month,
  COUNT(*) AS returning_customers
FROM
  `olist-analytics-497811.dataset.customer_master`
WHERE
  total_orders > 1
GROUP BY
  purchase_month
ORDER BY
  purchase_month;