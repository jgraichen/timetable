package de.altimos.timetable.basic

import de.altimos.timetable.IRoute
import de.altimos.timetable.IStation
import org.eclipse.xtend.lib.annotations.Accessors

class Route implements IRoute {
	
	@Accessors
	var IStation station
	
	@Accessors
	var IStation destination
	
	@Accessors
	var int travelDuration
	
	@Accessors
	var int trackCount
	
	@Accessors
	var int speedLimit
}