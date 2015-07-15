package de.altimos.fremo.timetable

import javax.xml.datatype.Duration

interface TimetableEntry {
	def Train getTrain()
	def Track getTrack()
	def Duration getArrival()
	def Duration getDeparture()
	def String getRemark()
	def TimetableEntry getNext()
	def TimetableEntry getPrev()
}