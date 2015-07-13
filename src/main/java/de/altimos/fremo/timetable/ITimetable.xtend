package de.altimos.fremo.timetable

import java.util.List

interface ITimetable {
	def List<IStation> getStations()
	def List<ITrain> getTrains()
	def List<ITimetableEntry> getTimetableEntries()
}