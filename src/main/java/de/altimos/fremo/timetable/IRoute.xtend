package de.altimos.fremo.timetable

import javax.xml.datatype.Duration

interface IRoute {
	def IStation getDestination()
	def IStation getStation()
	def Duration getTravelDuration()
	def int getTrackCount()
	def int getSpeedLimit()
}