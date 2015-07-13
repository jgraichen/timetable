package de.altimos.fremo.timetable

import java.util.List

interface IStation {
	def String getName()
	def String getRemark()
	def List<ITrack> getTracks()
	def List<ITimetableEntry> getTimetableEntries()
}