package de.altimos.fremo.timetable.basic

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.Station
import de.altimos.fremo.timetable.Timetable
import de.altimos.fremo.timetable.TimetableEntry
import de.altimos.fremo.timetable.Train

class BasicTimetable implements Timetable {
	
	@Accessors(PUBLIC_GETTER)
	val List<Train> trains = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<Station> stations = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<TimetableEntry> timetableEntries = new ArrayList
	
}