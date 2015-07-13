package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.ITimetable
import de.altimos.fremo.timetable.ITimetableEntry
import de.altimos.fremo.timetable.ITrain
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.IStation

class Timetable implements ITimetable {
	
	@Accessors(PUBLIC_GETTER)
	val List<ITrain> trains = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<IStation> stations = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<ITimetableEntry> timetableEntries = new ArrayList
	
}