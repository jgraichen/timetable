package de.altimos.fremo.timetable.basic

import org.eclipse.xtend.lib.annotations.Accessors
import javax.xml.datatype.Duration
import de.altimos.fremo.timetable.ITimetableEntry
import de.altimos.fremo.timetable.ITrack
import de.altimos.fremo.timetable.ITrain
import de.altimos.fremo.timetable.Util

class TimetableEntry implements ITimetableEntry {
	
	@Accessors(PUBLIC_GETTER)
	var ITrain train
	
	@Accessors(PUBLIC_GETTER)
	var ITrack track
	
	@Accessors(PUBLIC_GETTER)
	var Duration arrival
	
	@Accessors(PUBLIC_GETTER)
	var Duration departure
	
	@Accessors(PUBLIC_GETTER)
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	var ITimetableEntry prev
	
	@Accessors(PUBLIC_GETTER)
	var ITimetableEntry next
	
	new(ITrain train, ITrack track, ITimetableEntry prev, Duration arrival, Duration departure, String remark) {
		this.train = train
		this.track = track
		this.arrival = arrival
		this.departure = departure
		this.remark = remark
		this.prev = prev
	}
	
	new(ITrain train, ITrack track, ITimetableEntry prev, String arrival, String departure, String remark) {
		this(train, track, prev, Util.parseTime(arrival), Util.parseTime(departure), remark)
	}
	
	def setNext(ITimetableEntry entry) {
		this.next = entry
	}
}