package de.altimos.fremo.timetable.basic

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.Arrangement
import de.altimos.fremo.timetable.Project
import de.altimos.fremo.timetable.Timetable

class BasicProject implements Project {
	
	@Accessors(PUBLIC_GETTER)
	Arrangement arrangement
	
	@Accessors(PUBLIC_GETTER)
	List<Timetable> timetables = new ArrayList
	
	new(Arrangement arrangement) {
		this.arrangement = arrangement
	}
}