package de.altimos.fremo.timetable

interface IStation {
	def String getName()
	def String getRemark()
	def Iterable<ITrack> getTracks()
	def Iterable<ITimetableEntry> getTimetableEntries()
}