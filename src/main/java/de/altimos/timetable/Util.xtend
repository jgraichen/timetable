package de.altimos.timetable

import org.jopendocument.util.TimeUtils
import javax.xml.datatype.Duration

class Util {
	def static dispatch parseTime(String time) {
		if(time.matches("^\\d+:\\d+$")) {
			val ints = time.split(":").take(2).map[ Integer.parseInt(it) ].toList
			TimeUtils.getTypeFactory().newDuration("PT" + ints.get(0) + "H" + ints.get(1) + "M")
		} else {
			throw new RuntimeException("Unknown time format: " + time)
		}
	}
	
	def static dispatch parseTime(Duration it) {
		return it
	}
}