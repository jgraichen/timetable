package de.altimos.fremo.timetable

import java.util.List

interface ITrain {
	def int getNumber()
	def String getName()
	def String getRemark()
	def List<ITimetableEntry> getTimetableEntries()
}