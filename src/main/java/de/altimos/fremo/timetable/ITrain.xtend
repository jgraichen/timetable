package de.altimos.fremo.timetable

interface ITrain {
	def int getNumber()
	def String getName()
	def String getRemark()
	def Iterable<? extends ITimetableEntry> getTimetableEntries()
}