-- Verify tdetector:tdetector on pg

BEGIN;

select refnum,direction,detector_id,geom
from tempseg.tdetector
where false;

select 1/count(*)
from tempseg.tdetector;


ROLLBACK;
