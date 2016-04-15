--- cut from '~/repos/jem/osm/sql/views/versioned_routes_work.sql'

drop view tempseg.tdetector;
create view tempseg.tdetector as
    SELECT
           twim.freeway_id as refnum,
           twim.direction,
           'wimid_' || site_no as detector_id,
           geom  -- the detector's location
    FROM tempseg.twim
    WHERE wim_type ~* 'data'

  UNION
  SELECT -- tvd.id as vds_id,
         tvd.freeway_id as refnum,
         tvd.freeway_dir as direction,
         'vdsid_' || id as detector_id,
         geom  -- the detector's location
   FROM newtbmap.tvd
   WHERE vdstype='ML'
   order by refnum,direction
;
