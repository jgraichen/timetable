package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.IStation
import de.altimos.fremo.timetable.ITimetable
import de.altimos.fremo.timetable.ITrain
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class Timetable implements ITimetable {
	
	@Accessors(PUBLIC_GETTER)
	val List<ITrain> trains = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<IStation> stations = new ArrayList
	
	def void add(Station it) {
		it.timetable = this
		
		stations.add(it)
	}
	
	def void add(Train it) {
		trains.add(it)
	}
	
	def void add(TimetableEntry it) {
		
	}
	
	def void push(Train it) {
		trains.add(0, it)
	}
}