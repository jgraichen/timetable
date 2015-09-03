package de.altimos.timetable.basic

import de.altimos.timetable.IRoute
import de.altimos.timetable.IStation
import de.altimos.timetable.ITrack
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

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