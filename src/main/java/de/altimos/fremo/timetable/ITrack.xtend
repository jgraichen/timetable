package de.altimos.fremo.timetable

interface ITrack {
	def String getName()
	def String getRemark()
	def IStation getStation()
}