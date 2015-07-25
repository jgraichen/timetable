package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.ITrain
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class Train implements ITrain {
	
	@Accessors
	var int number
	
	@Accessors
	var String name
	
	@Accessors
	var String remark
	
	@Accessors(PUBLIC_GETTER)
	val List<TimetableEntry> timetableEntries = new ArrayList

	def add(TimetableEntry entry) {
		val last = timetableEntries.last
		
		entry.train = this
		entry.prev = last
		
		if(last != null) {
			last.next = entry
		}
		
		timetableEntries += entry
	}
}