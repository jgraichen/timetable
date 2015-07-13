package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.IArrangement
import de.altimos.fremo.timetable.IProject
import de.altimos.fremo.timetable.ITimetable
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class Project implements IProject {
	
	@Accessors(PUBLIC_GETTER)
	IArrangement arrangement
	
	@Accessors(PUBLIC_GETTER)
	List<ITimetable> timetables = new ArrayList
	
	new(IArrangement arrangement) {
		this.arrangement = arrangement
	}
}