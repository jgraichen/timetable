package de.altimos.fremo.timetable.serializer

import de.altimos.fremo.timetable.IStation
import de.altimos.fremo.timetable.ITimetableEntry

class BFOSerializer {
	def String serialize(IStation it) {
		timetableEntries.map[serialize].join("\n")
	}
	
	def serialize(ITimetableEntry it) {
		val TB = "\t"
		'''«arrivalString»«TB»«departureString»«TB»'''
	}
	
	def private arrivalString(ITimetableEntry it) {
		if(prev == null && arrival == departure) {
			''''''
		} else if(arrival == departure) {
			'''-->'''
		} else {
			'''«arrival.hours»:«arrival.minutes»'''
		}
	}
	
	def private departureString(ITimetableEntry it) {
		if(next == null && arrival == departure) {
			''''''
		} else {
			'''«departure.hours»:«departure.minutes»'''
		}
	}
}