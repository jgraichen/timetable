package de.altimos.fremo.timetable

import java.util.List

interface Arrangement {
	def List<Station> getStations()
	def List<Route> getRoutes()
}