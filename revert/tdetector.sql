-- Revert tdetector:tdetector from pg

BEGIN;

drop view tempseg.tdetector;

COMMIT;
