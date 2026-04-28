-- Total Revenue
SELECT 
  ROUND(SUM(sale_price), 2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete';

-- Revenue by Category
SELECT 
  p.category,
  ROUND(SUM(oi.sale_price), 2) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
WHERE oi.status = 'Complete'
GROUP BY p.category
ORDER BY revenue DESC;

-- Monthly Revenue Trend
SELECT 
  FORMAT_DATE('%Y-%m', DATE(created_at)) AS month,
  ROUND(SUM(sale_price), 2) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete'
GROUP BY month
ORDER BY month;