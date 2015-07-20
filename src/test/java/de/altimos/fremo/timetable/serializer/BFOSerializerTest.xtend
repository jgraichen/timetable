package de.altimos.fremo.timetable.serializer

import de.altimos.fremo.timetable.ITimetable
import de.altimos.fremo.timetable.basic.TimetableBuilder
import de.altimos.fremo.timetable.basic.Track
import org.junit.BeforeClass
import org.junit.Test

import static org.junit.Assert.*

class BFOSerializerTest {
	
	var static ITimetable timetable
	
	@BeforeClass
	def static void setupTimetable() {
		val builder = new TimetableBuilder => [
			addStation("Lwa", "Leipzig-Wahren") => [
				tracks += new Track(it, "1", "")
				tracks += new Track(it, "2", "")
				tracks += new Track(it, "3", "")
				tracks += new Track(it, "4", "")
				tracks += new Track(it, "5", "")
				tracks += new Track(it, "6", "")
			]
			
			addStation("Jwz", "Jannowitz") => [
				tracks += new Track(it, "1", "")
				tracks += new Track(it, "2", "")
				tracks += new Track(it, "3", "")
			]
			
			addStation("Pst", "Posthausen") => [
				tracks += new Track(it, "1", "")
				tracks += new Track(it, "2", "")
			]
			
			addTrain(61, "FD 61", "Fernschnellzug")
			
			addTimetableEntry("FD 61", "Lwa", "1", "05:11", "05:11", "")
			addTimetableEntry("FD 61", "Jwz", "2", "05:18", "05:18", "")
			addTimetableEntry("FD 61", "Pst", "2", "05:34", "05:38", "")
		]
		
		timetable = builder.build
	}
	
	@Test
	def void testSerializeStartStation() {
		val text = new BFOSerializer().serialize(timetable.stations.get(0))
		val lines = text.split("\n")
		
		assertTrue(lines.length == 1)
		
		val values = lines.get(0).split("\t")
		
		assertEquals("", values.get(0))
		assertEquals("5:11", values.get(1))
	}
	
	@Test
	def void testSerializePassthruStation() {
		val text = new BFOSerializer().serialize(timetable.stations.get(1))
		val lines = text.split("\n")
		
		assertTrue(lines.length == 1)
		
		val values = lines.get(0).split("\t")
		assertEquals("-->", values.get(0))
		assertEquals("5:18", values.get(1))
	}
	
	@Test
	def void testSerializeHaltStation() {
		val text = new BFOSerializer().serialize(timetable.stations.get(2))
		val lines = text.split("\n")
		
		assertTrue(lines.length == 1)
		
		val values = lines.get(0).split("\t")
		assertEquals("5:34", values.get(0))
		assertEquals("5:38", values.get(1))
	}
}