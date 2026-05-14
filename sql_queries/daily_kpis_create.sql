CREATE OR REPLACE TABLE `ga4journey.analytics.daily_kpis` AS
WITH base AS (
  SELECT
    event_date,
    user_pseudo_id,
    ga_session_id,
    event_name,
    transaction_id,
    purchase_revenue
  FROM `ga4journey.raw.events_base`
)

SELECT
  event_date,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNT(DISTINCT CONCAT(user_pseudo_id, '-', CAST(ga_session_id AS STRING))) AS sessions,
  COUNTIF(event_name = 'page_view') AS page_views,
  COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN transaction_id END) AS orders,
  ROUND(SUM(CASE WHEN event_name = 'purchase' THEN purchase_revenue ELSE 0 END), 2) AS revenue,
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN transaction_id END),
      COUNT(DISTINCT CONCAT(user_pseudo_id, '-', CAST(ga_session_id AS STRING)))
    ) * 100,
    2
  ) AS conversion_rate_pct
FROM base
GROUP BY event_date
ORDER BY event_date;
