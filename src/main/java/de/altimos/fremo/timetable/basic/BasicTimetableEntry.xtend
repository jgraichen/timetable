package de.altimos.fremo.timetable.basic

import org.eclipse.xtend.lib.annotations.Accessors
import javax.xml.datatype.Duration
import de.altimos.fremo.timetable.TimetableEntry
import de.altimos.fremo.timetable.Track
import de.altimos.fremo.timetable.Train

class BasicTimetableEntry implements TimetableEntry {
	
	@Accessors(PUBLIC_GETTER)
	var Train train
	
	@Accessors(PUBLIC_GETTER)
	var Track track
	
	@Accessors(PUBLIC_GETTER)
	var Duration arrival
	
	@Accessors(PUBLIC_GETTER)
	var Duration departure
	
	@Accessors(PUBLIC_GETTER)
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	var TimetableEntry prev
	
	@Accessors(PUBLIC_GETTER)
	var TimetableEntry next
	
	new(Train train, Track track, TimetableEntry prev, Duration arrival, Duration departure, String remark) {
		this.train = train
		this.track = track
		this.arrival = arrival
		this.departure = departure
		this.remark = remark
		this.prev = prev
	}
	
	def setNext(TimetableEntry entry) {
		this.next = entry
	}
}