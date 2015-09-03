package de.altimos.timetable.basic

import de.altimos.timetable.ITrack
import org.eclipse.xtend.lib.annotations.Accessors

class Track implements ITrack {
	
	@Accessors
	var String name
	
	@Accessors
	var String remark
	
	@Accessors
	var Station station

}