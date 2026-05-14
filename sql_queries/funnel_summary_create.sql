CREATE OR REPLACE TABLE `ga4journey.analytics.funnel_summary` AS
WITH base AS (
  SELECT DISTINCT
    event_name,
    user_pseudo_id,
    CONCAT(user_pseudo_id, '-', CAST(ga_session_id AS STRING)) AS session_id
  FROM `ga4journey.raw.events_base`
  WHERE event_name IN ('view_item', 'add_to_cart', 'begin_checkout', 'purchase')
)

SELECT
  event_name AS funnel_step,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNT(DISTINCT session_id) AS sessions
FROM base
GROUP BY event_name
ORDER BY
  CASE event_name
    WHEN 'view_item' THEN 1
    WHEN 'add_to_cart' THEN 2
    WHEN 'begin_checkout' THEN 3
    WHEN 'purchase' THEN 4
  END;
