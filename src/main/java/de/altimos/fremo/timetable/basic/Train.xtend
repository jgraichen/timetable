package de.altimos.fremo.timetable.basic

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.ITimetableEntry
import de.altimos.fremo.timetable.ITrain

class Train implements ITrain {
	
	@Accessors(PUBLIC_GETTER)
	var int number
	
	@Accessors(PUBLIC_GETTER)
	var String name
	
	@Accessors(PUBLIC_GETTER)
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	val List<ITimetableEntry> timetableEntries = new ArrayList
	
	new(int number, String name, String remark) {
		this.name = name
		this.number = number
		this.remark = remark
	}
}