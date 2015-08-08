package de.altimos.fremo.timetable.serializer

import de.altimos.fremo.timetable.IStation
import de.altimos.fremo.timetable.ITimetableEntry
import java.util.ArrayList

class BFOSerializer {
	val static EMPTY = ""
	
	def String serialize(IStation it) {
		timetableEntries.map[serialize].join("\n")
	}
	
	def serialize(ITimetableEntry it) {
		var values = new ArrayList
		
		values.add(arrivalString)
		values.add(departureString)
		values.add(trainString)
		values.add(auxiliaryTrainString)
		values.add(EMPTY)
		values.add(trackString)
		values.add(startStationString)
		values.add(destinationStationString)
		values.add(coachTransferString)
		values.add(engineTransferString)
		values.add(remarkString)
		
		values.join("\t")
	}
	
	def private arrivalString(ITimetableEntry it) {
		if(arrival == null || prev == null) {
			""
		} else if(arrival == departure) {
			"-->"
		} else {
			arrival.hours + ":" + arrival.minutes
		}
	}
	
	def private departureString(ITimetableEntry it) {
		if(departure == null || next == null) {
			""
		} else {
			departure.hours + ":" + departure.minutes
		}
	}
	
	def private trainString(ITimetableEntry it) {
		train.name
	}
	
	def private auxiliaryTrainString(ITimetableEntry it) {
		""
	}
	
	def private trackString(ITimetableEntry it) {
		track.name
	}
	
	def private startStationString(ITimetableEntry it) {
		if(prev != null) {
			prev.track.station.name
		} else {
			""
		}
	}
	
	def private destinationStationString(ITimetableEntry it) {
		if(next != null) {
			next.track.station.name
		} else {
			""
		}
	}
	
	def private coachTransferString(ITimetableEntry it) {
		""
	}
	
	def private engineTransferString(ITimetableEntry it) {
		if(engineTransfer == null) {
			""
		} else {
			engineTransfer.name
		}
	}
	
	def private remarkString(ITimetableEntry it) {
		'''«remark»'''
	}
}