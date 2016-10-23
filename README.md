# tdetector table of detectors, both wim and vds

This was a view, but pretty useful

requires both tvd and twim

plus whatever schema,

etc.



# dependency notes

I'm directly depending on tvd, twim here, but realy those are more
properly pulled in by update detectors osm, I think.

I thought about breaking the direct dependency, but that is dumb
because maybe someday I update or move update detectors code...this
still needs to have tvd, twim deployed.

So, to actually run this code, you need to first deploy tvd, twim, and
then be sure to run the update code that for the moment lives in
update_detectors_osm.  Go read the README there for information on how
to properly run that code such that it updates twim, tvd in the target
database.

*Then* you can run this code (sqitch deploy) to create the view.
Well, it is a view, so you can run it anytime, and it will always have
the updates to the underlying table, but still...after running update
detectors osm, this view will be up to date as well.



Not sure if this is the best idea in the world, but I want to be able to
do the update detectors thing in the right order, and update detectors
depens on tvd, twim being deployed, and this code realy needs that the
detctors are updates, not just deployed, so I guess it makes sense.
