CREATE OR REPLACE TABLE `ga4journey.analytics.overview_summary` AS
SELECT
  COUNT(DISTINCT user_pseudo_id) AS total_users,
  COUNT(DISTINCT CONCAT(user_pseudo_id, '-', CAST(ga_session_id AS STRING))) AS total_sessions,
  COUNTIF(event_name = 'page_view') AS total_page_views,
  COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN transaction_id END) AS total_orders,
  ROUND(SUM(CASE WHEN event_name = 'purchase' THEN purchase_revenue ELSE 0 END), 2) AS total_revenue,
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN transaction_id END),
      COUNT(DISTINCT CONCAT(user_pseudo_id, '-', CAST(ga_session_id AS STRING)))
    ) * 100,
    2
  ) AS conversion_rate_pct
FROM `ga4journey.raw.events_base`;
