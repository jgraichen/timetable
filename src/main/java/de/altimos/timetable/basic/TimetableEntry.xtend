package de.altimos.timetable.basic

import de.altimos.timetable.ITimetableEntry
import de.altimos.timetable.Util
import javax.xml.datatype.Duration
import org.eclipse.xtend.lib.annotations.Accessors

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