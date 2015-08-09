package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.IRoute
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.IStation
import javax.xml.datatype.Duration

class Route implements IRoute {
	
	@Accessors
	var IStation station
	
	@Accessors
	var IStation destination
	
	@Accessors
	var Duration travelDuration
	
	@Accessors
	var int trackCount
	
	@Accessors
	var int speedLimit
}