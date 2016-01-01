package de.altimos.timetable

interface IStation {
	def String getName()
	def String getAbbreviation()
	def Iterable<ITrack> getTracks()
	def Iterable<ITimetableEntry> getTimetableEntries()
	def Iterable<IRoute> getRoutes()
}