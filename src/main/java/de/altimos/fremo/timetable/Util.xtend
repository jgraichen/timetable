package de.altimos.fremo.timetable

import org.jopendocument.util.TimeUtils

class Util {
	def static parseTime(String time) {
		val ints = time.split(":").take(2).map[ Integer.parseInt(it) ].toList
		
		TimeUtils.getTypeFactory().newDuration("PT" + ints.get(0) + "H" + ints.get(1) + "M")
	}
}