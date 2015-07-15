package de.altimos.fremo.timetable

import java.util.List

interface Station {
	def String getName()
	def String getRemark()
	def List<Track> getTracks()
	def List<TimetableEntry> getTimetableEntries()
}