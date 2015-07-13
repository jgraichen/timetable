package de.altimos.fremo.timetable

import javax.xml.datatype.Duration

interface ITimetableEntry {
	def ITrain getTrain()
	def ITrack getTrack()
	def Duration getArrival()
	def Duration getDeparture()
	def String getRemark()
	def ITimetableEntry next()
	def ITimetableEntry prev()
}