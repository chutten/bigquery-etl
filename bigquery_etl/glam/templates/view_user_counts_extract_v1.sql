CREATE OR REPLACE VIEW
  `moz-fx-data-shared-prod.{{ dataset }}.{{ prefix }}_view_user_counts_extract_v1`
AS
WITH deduped AS (
  SELECT
    *,
    ROW_NUMBER() OVER(
        PARTITION BY channel, app_version, ping_type, app_build_id, os
        ORDER BY total_users DESC
    ) AS rank
  FROM
    `moz-fx-data-shared-prod.{{ dataset }}.{{ prefix }}_user_counts_v1`
)

SELECT
  channel,
  app_version,
  coalesce(ping_type, "*") as ping_type,
  COALESCE(app_build_id, "*") AS app_build_id,
  COALESCE(os, "*") AS os,
  total_users
FROM deduped
WHERE rank = 1;
