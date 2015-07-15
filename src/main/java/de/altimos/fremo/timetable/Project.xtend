package de.altimos.fremo.timetable

import java.util.List

interface Project {
	def Arrangement getArrangement()
	def List<Timetable> getTimetables()
}