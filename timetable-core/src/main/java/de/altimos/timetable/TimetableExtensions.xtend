package de.altimos.timetable

class TimetableExtensions {
	def static ITrain findTrain(ITimetable it, int trainNumber) {
		trains.findFirst[ number == trainNumber ]
	}
	
	def static IStation findStation(ITimetable it, String abbr) {
		stations.findFirst[ abbreviation == abbr ]
	}
	
	def static ITrack findTrack(ITimetable it, String stationName, String trackName) {
		findStation(stationName).findTrack(trackName)
	}
	
	def static ITrack findTrack(IStation it, String trackName) {
		tracks.findFirst[ name == trackName ]
	}
}