package de.altimos.timetable

interface IRoute {
	def IStation getDestination()
	def IStation getStation()
	def int getTravelDuration()
	def int getTrackCount()
	def int getSpeedLimit()
}