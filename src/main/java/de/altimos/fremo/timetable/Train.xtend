package de.altimos.fremo.timetable

import java.util.List

interface Train {
	def int getNumber()
	def String getName()
	def String getRemark()
	def List<TimetableEntry> getTimetableEntries()
}