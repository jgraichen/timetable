package de.altimos.fremo.timetable

import java.util.List

interface Timetable {
	def List<Station> getStations()
	def List<Train> getTrains()
	def List<TimetableEntry> getTimetableEntries()
}