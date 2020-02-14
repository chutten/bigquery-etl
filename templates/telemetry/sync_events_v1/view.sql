-- Query generated by: templates/unnest_parquet_view.sql.py sync_events_v1 telemetry_derived.sync_events_v1
CREATE OR REPLACE VIEW
  `moz-fx-data-shared-prod.telemetry.sync_events_v1`
AS
SELECT
  submission_date_s3 AS submission_date,
  * REPLACE (event_map_values.key_value AS event_map_values)
FROM
  `moz-fx-data-derived-datasets.telemetry_derived.sync_events_v1`