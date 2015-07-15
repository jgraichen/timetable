package de.altimos.fremo.timetable.basic

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.Station
import de.altimos.fremo.timetable.TimetableEntry
import de.altimos.fremo.timetable.Track

class BasicStation implements Station {
	
	@Accessors(PUBLIC_GETTER)
	var String name
	
	@Accessors(PUBLIC_GETTER)
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	val List<Track> tracks = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<TimetableEntry> timetableEntries = new ArrayList
	
	new(String name, String remark) {
		this.name = name
		this.remark = remark
	}
}