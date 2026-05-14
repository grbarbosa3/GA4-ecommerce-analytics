CREATE OR REPLACE TABLE `ga4journey.raw.events_base` AS
SELECT
  PARSE_DATE('%Y%m%d', event_date) AS event_date,
  TIMESTAMP_MICROS(event_timestamp) AS event_timestamp,
  event_name,
  user_pseudo_id,

  (
    SELECT value.int_value
    FROM UNNEST(event_params)
    WHERE key = 'ga_session_id'
  ) AS ga_session_id,

  (
    SELECT value.string_value
    FROM UNNEST(event_params)
    WHERE key = 'page_title'
  ) AS page_title,

  (
    SELECT value.string_value
    FROM UNNEST(event_params)
    WHERE key = 'page_location'
  ) AS page_location,

  device.category AS device_category,
  geo.country AS country,
  ecommerce.transaction_id,
  ecommerce.purchase_revenue
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131';
