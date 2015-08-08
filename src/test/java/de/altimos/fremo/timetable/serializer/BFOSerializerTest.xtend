package de.altimos.fremo.timetable.serializer

import de.altimos.fremo.timetable.basic.Station
import de.altimos.fremo.timetable.basic.Timetable
import de.altimos.fremo.timetable.basic.TimetableEntry
import de.altimos.fremo.timetable.basic.Track
import de.altimos.fremo.timetable.basic.Train
import org.junit.BeforeClass
import org.junit.Test

import static org.junit.Assert.*
import static extension de.altimos.fremo.timetable.TimetableExtensions.*

class BFOSerializerTest {
	
	var static Timetable timetable
	
	@BeforeClass
	def static void setupTimetable() {
		timetable = new Timetable
		timetable => [
			add(new Station => [
				abbreviation = "Gr"
				name = "Görlitz"
				
				add(new Track => [ name = "1" ])
				add(new Track => [ name = "2" ])
				add(new Track => [ name = "3" ])
				add(new Track => [ name = "4" ])
				add(new Track => [ name = "5" ])
				add(new Track => [ name = "6" ])
			])
			add(new Station => [
				abbreviation = "Jwz"
				name = "Jannowitz"
				
				add(new Track => [ name = "1" ])
				add(new Track => [ name = "2" ])
				add(new Track => [ name = "3" ])
			])
			add(new Station => [
				abbreviation = "Pst"
				name = "Posthausen"
				
				add(new Track => [ name = "1" ])
				add(new Track => [ name = "2" ])
			])
			add(new Station => [
				abbreviation = "Drp"
				name = "Dörpfen"
				
				add(new Track => [ name = "1" ])
				add(new Track => [ name = "2" ])
				add(new Track => [ name = "3" ])
				add(new Track => [ name = "4" ])
				add(new Track => [ name = "112" ])
				add(new Track => [ name = "113" ])
			])
			add(new Station => [
				abbreviation = "Lwa"
				name = "Leipzig-Wahren"
				
				add(new Track => [ name = "1" ])
				add(new Track => [ name = "2" ])
				add(new Track => [ name = "3" ])
				add(new Track => [ name = "4" ])
				add(new Track => [ name = "5" ])
				add(new Track => [ name = "6" ])
				add(new Track => [ name = "7" ])
				add(new Track => [ name = "8" ])
			])
			add(new Station => [
				abbreviation = "Lbw"
				name = "Leipzig-Betriebswerk"
				
				add(new Track => [ name = "1" ])
			])
			
			push(new Train => [
				number = 77001
				name = "Tfzf 77001"
				
				add(new TimetableEntry => [
					track = timetable.findTrack("Lwa", "8") as Track
					departure = "06:02"
				])
				add(new TimetableEntry => [
					track = timetable.findTrack("Lbw", "1") as Track
					arrival = "06:08"
					remark = "Tfz abstellen"
				])
			])
			
			push(new Train => [
				number = 61
				name = "FD 61"
				remark = "Fernschnellzug Leipzig-Görlitz"	
				
				add(new TimetableEntry => [
					track = timetable.stations.get(0).tracks.get(0) as Track
					arrival = "05:11"
					departure = "05:11"
				])
				add(new TimetableEntry => [
					track = timetable.stations.get(1).tracks.get(1) as Track
					arrival = "05:18"
					departure = "05:18"
					remark = "Fernschnellzug. Wichtig!"
				])
				add(new TimetableEntry => [
					track = timetable.stations.get(2).tracks.get(1) as Track
					arrival = "05:34"
					departure = "05:34"
				])
				add(new TimetableEntry => [
					track = timetable.stations.get(3).tracks.get(2) as Track
					arrival = "05:45"
					departure = "05:47"
				])
				add(new TimetableEntry => [
					track = timetable.stations.get(4).tracks.get(7) as Track
					arrival = "05:50"
					engineTransfer = timetable.trains.get(0) as Train
					remark = "Wagen ausstellen"
				])
			])
		]
	}
	
	@Test
	def void testSerializeStartStation() {
		val text = new BFOSerializer().serialize(timetable.stations.get(0))
		val lines = text.split("\n")
		
		assertTrue(lines.length == 1)
		
		lines.get(0).split("\t", -1) => [
			assertEquals(11, length)
			
			assertEquals("", get(0))
			assertEquals("5:11", get(1))
			assertEquals("FD 61", get(2))
			assertEquals("", get(3))
			assertEquals("", get(4))
			assertEquals("1", get(5))
			assertEquals("", get(6))
			assertEquals("Jannowitz", get(7))
			assertEquals("", get(8))
			assertEquals("", get(9))
			assertEquals("", get(10))
		]
	}
	
	@Test
	def void testSerializePassthruStation() {
		val text = new BFOSerializer().serialize(timetable.stations.get(1))
		val lines = text.split("\n")
		
		assertTrue(lines.length == 1)
		
		lines.get(0).split("\t", -1) => [
			assertEquals(11, length)
			
			assertEquals("-->", get(0))
			assertEquals("5:18", get(1))
			assertEquals("FD 61", get(2))
			assertEquals("", get(3))
			assertEquals("", get(4))
			assertEquals("2", get(5))
			assertEquals("Görlitz", get(6))
			assertEquals("Posthausen", get(7))
			assertEquals("", get(8))
			assertEquals("", get(9))
			assertEquals("Fernschnellzug. Wichtig!", get(10))
		]
	}
	
	@Test
	def void testSerializeDestinationStation() {
		val text = new BFOSerializer().serialize(timetable.stations.get(4))
		val lines = text.split("\n")
		
		assertTrue(lines.length >= 1)
		
		lines.get(0).split("\t", -1) => [
			assertEquals(11, length)
			
			assertEquals("5:50", get(0))
			assertEquals("", get(1))
			assertEquals("FD 61", get(2))
			assertEquals("", get(3))
			assertEquals("", get(4))
			assertEquals("8", get(5))
			assertEquals("Dörpfen", get(6))
			assertEquals("", get(7))
			assertEquals("", get(8))
			assertEquals("Tfzf 77001", get(9))
			assertEquals("Wagen ausstellen", get(10))
		]
	}
}