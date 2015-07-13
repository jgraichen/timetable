package de.altimos.fremo.timetable

import java.util.List

interface IArrangement {
	def List<IStation> getStations()
	def List<IRoute> getRoutes()
}