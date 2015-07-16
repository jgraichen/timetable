package de.altimos.fremo.timetable.basic

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.IStation
import de.altimos.fremo.timetable.ITimetableEntry
import de.altimos.fremo.timetable.ITrack

class Station implements IStation {
	
	@Accessors(PUBLIC_GETTER)
	var String name
	
	@Accessors(PUBLIC_GETTER)
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	val List<ITrack> tracks = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<ITimetableEntry> timetableEntries = new ArrayList
	
	new(String name, String remark) {
		this.name = name
		this.remark = remark
	}
}