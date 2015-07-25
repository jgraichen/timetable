package de.altimos.fremo.timetable

class TimetableExtensions {
	def static IStation findStation(ITimetable it, String stationName) {
		stations.findFirst[ name == stationName ]
	}
	
	def static ITrack findTrack(ITimetable it, String stationName, String trackName) {
		findStation(stationName).findTrack(trackName)
	}
	
	def static ITrack findTrack(IStation it, String trackName) {
		tracks.findFirst[ name == trackName ]
	}
}