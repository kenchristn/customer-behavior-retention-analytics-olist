-- =========================================
-- Data Quality Check: Row Count
-- =========================================

SELECT 'customers' AS table_name, COUNT(*) AS total_rows
FROM `olist-analytics-497811.dataset.customers`

UNION ALL

SELECT 'orders', COUNT(*)
FROM `olist-analytics-497811.dataset.orders`

UNION ALL

SELECT 'order_items', COUNT(*)
FROM `olist-analytics-497811.dataset.order_items`

UNION ALL

SELECT 'order_payments', COUNT(*)
FROM `olist-analytics-497811.dataset.order_payments`

UNION ALL

SELECT 'order_reviews', COUNT(*)
FROM `olist-analytics-497811.dataset.order_reviews`

UNION ALL

SELECT 'products', COUNT(*)
FROM `olist-analytics-497811.dataset.products`

UNION ALL

SELECT 'sellers', COUNT(*)
FROM `olist-analytics-497811.dataset.sellers`

UNION ALL

SELECT 'geolocation', COUNT(*)
FROM `olist-analytics-497811.dataset.geolocation`;