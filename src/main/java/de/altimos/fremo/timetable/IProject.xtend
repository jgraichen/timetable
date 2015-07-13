package de.altimos.fremo.timetable

import java.util.List

interface IProject {
	def IArrangement getArrangement()
	def List<ITimetable> getTimetables()
}