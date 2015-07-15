package de.altimos.fremo.timetable.basic

import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.Station
import de.altimos.fremo.timetable.Track

class BasicTrack implements Track {
	
	@Accessors(PUBLIC_GETTER)
	var String name
	
	@Accessors(PUBLIC_GETTER)
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	var Station station
	
	new(Station station, String name, String remark) {
		this.name = name
		this.remark = remark
		this.station = station
	}
}