package de.altimos.fremo.timetable.basic

import de.altimos.fremo.timetable.ITimetable
import de.altimos.fremo.timetable.ITimetableEntry
import de.altimos.fremo.timetable.IStation
import de.altimos.fremo.timetable.ITrain

class TimetableBuilder {
	
	var timetable = new Timetable
	
	def ITimetable build() {
		timetable
	}
	
	def void reset() {
		timetable = new Timetable
	}
	
	def IStation addStation(String name, String remark) {
		new Station(name, remark) => [ timetable.stations += it	 ]
	}
	
	def ITrain addTrain(int number, String name, String remark) {
		new Train(number, name, remark) => [ timetable.trains += it ]
	}
	
	def addTimetableEntry(String trainName, String stationName, String trackName, String arrival, String departure, String remark) {
		val train   = timetable.trains.findFirst[ name == trainName ]
		val station = timetable.stations.findFirst[ name == stationName ]
		val track   = station.tracks.findFirst[ name == trackName ]
		val prev    = train.timetableEntries.last
		
		new TimetableEntry(train, track, prev, arrival, departure, remark) => [
			train.timetableEntries += it
			station.timetableEntries += it
			
			if(prev instanceof TimetableEntry) {
				if(prev != null) {
					prev.next = it
				}
			}
		]
	}
}