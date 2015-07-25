package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.ITimetableEntry
import javax.xml.datatype.Duration
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.Util

class TimetableEntry implements ITimetableEntry {
	
	@Accessors
	var Train train
	
	@Accessors
	var Track track
	
	@Accessors
	var Duration arrival
	
	@Accessors
	var Duration departure
	
	@Accessors
	var String remark
	
	@Accessors
	var TimetableEntry prev
	
	@Accessors
	var TimetableEntry next
	
	@Accessors
	var Train coachTransfer
	
	@Accessors
	var Train engineTransfer
	
	def setArrival(String arrival) {
		arrival = Util.parseTime(arrival)
	}
	
	def setDeparture(String departure) {
		departure = Util.parseTime(departure)
	}
}