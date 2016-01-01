package de.altimos.timetable.serializer

import de.altimos.timetable.ITimetable
import de.altimos.timetable.IStation

class RgZmSerializer {
	def String serialize(ITimetable it) '''
		Betriebsstellen=«stations.map[name].join(',')»
		
		«stations.map[serializeTracks].join('\n')»
	'''
	
	def serializeTracks(IStation it) '''
		«name».gleise=«tracks.map[name].join(',')»
		«name».fahrplan=«abbreviation».bfo
	'''
}