package de.altimos.timetable

interface ITrain {
	def int getNumber()
	def String getName()
	def String getRemark()
	def Iterable<? extends ITimetableEntry> getTimetableEntries()
}