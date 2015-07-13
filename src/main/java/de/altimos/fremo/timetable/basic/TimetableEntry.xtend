package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.ITimetableEntry
import de.altimos.fremo.timetable.ITrack
import de.altimos.fremo.timetable.ITrain
import org.eclipse.xtend.lib.annotations.Accessors
import javax.xml.datatype.Duration

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
	
	var int index
	
	new(ITrain train, ITrack track, int index, Duration arrival, Duration departure, String remark) {
		this.train = train
		this.track = track
		this.arrival = arrival
		this.departure = departure
		this.remark = remark
		this.index = index
	}
	
	override next() {
		if(train.timetableEntries.length > index) {
			train.timetableEntries.get(index + 1)
		}
	}
	
	override prev() {
		if(index > 0) {
			train.timetableEntries.get(index - 1)
		}
	}
	
}