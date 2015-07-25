package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.ITrack
import org.eclipse.xtend.lib.annotations.Accessors

class Track implements ITrack {
	
	@Accessors
	var String name
	
	@Accessors
	var String remark
	
	@Accessors
	var Station station

}