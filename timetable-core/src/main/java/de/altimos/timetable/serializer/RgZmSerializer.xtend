package de.altimos.timetable.serializer

import de.altimos.timetable.ITimetable
import de.altimos.timetable.IStation
import java.util.regex.Pattern

class RgZmSerializer {
	static val pattern = Pattern.compile("[^\\w\\d\\-\\(\\)]+", Pattern.UNICODE_CHARACTER_CLASS)
	
	def String serialize(ITimetable it) '''
		Betriebsstellen=«stations.map[name.sanitize].join(',')»
		
		«stations.map[serializeTracks].join('\n')»
	'''
	
	def serializeTracks(IStation it) '''
		«name.sanitize».gleise=«tracks.map[name].join(',')»
		«name.sanitize».fahrplan=«abbreviation».bfo
	'''
	
	def sanitize(String it) {
		pattern.matcher(it).replaceAll("_")
	}
}