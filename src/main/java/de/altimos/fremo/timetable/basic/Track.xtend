package de.altimos.fremo.timetable.basic

import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.IStation
import de.altimos.fremo.timetable.ITrack

class Track implements ITrack {
	
	@Accessors(PUBLIC_GETTER)
	var String name
	
	@Accessors(PUBLIC_GETTER)
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	var IStation station
	
	new(IStation station, String name, String remark) {
		this.name = name
		this.remark = remark
		this.station = station
	}
}