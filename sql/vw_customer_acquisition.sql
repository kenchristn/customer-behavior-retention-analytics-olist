-- =========================================
-- View: Customer Acquisition Trend
-- =========================================

CREATE OR REPLACE VIEW
`olist-analytics-497811.dataset.vw_customer_acquisition`
AS

SELECT
  DATE_TRUNC(first_purchase_date, MONTH) AS purchase_month,
  COUNT(*) AS new_customers
FROM
  `olist-analytics-497811.dataset.customer_master`
GROUP BY
  purchase_month
ORDER BY
  purchase_month;