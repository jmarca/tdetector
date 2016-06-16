-- Deploy tdetector:tdetector to pg
-- requires: twim:populate_twim
-- requires: tvd:populate_tvd

BEGIN;

create view tempseg.tdetector as
    SELECT
           twim.freeway_id as refnum,
           twim.direction,
           'wimid_' || site_no as detector_id,
           geom  -- the detector's location
    FROM newtbmap.twim
    WHERE wim_type ~* 'data'
  UNION
  SELECT
         tvd.freeway_id as refnum,
         tvd.freeway_dir as direction,
         'vdsid_' || id as detector_id,
         geom  -- the detector's location
   FROM newtbmap.tvd
   WHERE vdstype in ('ML','CH')
   order by refnum,direction
;


COMMIT;
