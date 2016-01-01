package de.altimos.timetable

interface ITimetable {
	def Iterable<IStation> getStations()
	def Iterable<ITrain> getTrains()
}