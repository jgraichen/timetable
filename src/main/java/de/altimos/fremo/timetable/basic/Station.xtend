package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.IStation
import de.altimos.fremo.timetable.ITrack
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import de.altimos.fremo.timetable.IRoute

class Station implements IStation {
	
	@Accessors
	var String name
	
	@Accessors
	var String abbreviation
	
	@Accessors
	var Timetable timetable
	
	@Accessors(PUBLIC_GETTER)
	val List<ITrack> tracks = new ArrayList
	
	@Accessors(PUBLIC_GETTER)
	val List<IRoute> routes = new ArrayList
	
	override getTimetableEntries() {
		timetable.trains.map[timetableEntries.filter[track.station === this]].flatten
	}
	
	def add(Track track) {
		track.station = this
		
		tracks += track
	}
}