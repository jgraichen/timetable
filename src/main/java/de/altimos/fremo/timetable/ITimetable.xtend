package de.altimos.fremo.timetable

interface ITimetable {
	def Iterable<IStation> getStations()
	def Iterable<ITrain> getTrains()
}