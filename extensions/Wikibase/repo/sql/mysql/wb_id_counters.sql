-- This file is automatically generated using maintenance/generateSchemaSql.php.
-- Source: extensions/Wikibase/repo/sql/abstract/wb_id_counters.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
CREATE TABLE /*_*/wb_id_counters (
  id_value INT UNSIGNED NOT NULL,
  id_type VARBINARY(32) NOT NULL,
  UNIQUE INDEX wb_id_counters_type (id_type)
) /*$wgDBTableOptions*/;
