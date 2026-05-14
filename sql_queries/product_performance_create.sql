CREATE OR REPLACE TABLE `ga4journey.analytics.product_performance` AS
SELECT
  item_id,
  item_name,
  item_brand,
  item_category,

  COUNTIF(event_name = 'view_item') AS view_item_events,
  COUNTIF(event_name = 'add_to_cart') AS add_to_cart_events,
  COUNTIF(event_name = 'purchase') AS purchase_events,

  SUM(CASE WHEN event_name = 'purchase' THEN quantity ELSE 0 END) AS items_sold,
  ROUND(SUM(CASE WHEN event_name = 'purchase' THEN price * quantity ELSE 0 END), 2) AS product_revenue

FROM `ga4journey.raw.items_base`
GROUP BY
  item_id,
  item_name,
  item_brand,
  item_category
ORDER BY product_revenue DESC;
