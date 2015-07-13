package de.altimos.fremo.timetable.xpln

import org.jopendocument.util.TimeUtils
import org.junit.Test

import static org.junit.Assert.*

class XplnTest {
	
	@Test
	def void testTrainDefParse() {
		val timetable = new Xpln().load(class.getResource("test.ods"))
		
		assertEquals(86, timetable.trains.length)
		
		timetable.trains.get(0) => [
			assertEquals(61, number)
			assertEquals("FD 61", name)
			assertEquals("Fernschnellzug Görlitz–Leipzig–Frankfurt/Main", remark)
		]
	}
	
	@Test
	def void testTimetableParse() {
		val timetable = new Xpln().load(class.getResource("test.ods"))
		
		assertTrue(timetable.trains.length > 0)
		
		timetable.trains.get(0) => [
			assertEquals(61, number)
			assertEquals(6, timetableEntries.length)
			
			val te = timetableEntries
			
			te.get(0) => [
				assertEquals(TimeUtils.getTypeFactory().newDuration("PT5H11M"), arrival)
				assertEquals(TimeUtils.getTypeFactory().newDuration("PT5H11M"), departure)
				
				assertSame(timetable.trains.get(0), train)
				assertEquals("6", track.name)
				assertEquals("Gr", track.station.name)
				
				assertSame(null, prev)
				assertSame(te.get(1), next)
			]
		]
	}
	
	@Test
	def void testStationParse() {
		val timetable = new Xpln().load(class.getResource("test.ods"))
		
		assertEquals(16, timetable.stations.length)
		
		timetable.stations.get(0) => [
			assertEquals("LWa", name)
			assertEquals("Leipzig-Wahren", remark)
		]
	}
	
	@Test
	def void testStationTrackParse() {
		val timetable = new Xpln().load(class.getResource("test.ods"))
		
		assertEquals(16, timetable.stations.length)
		
		timetable.stations.get(0) => [
			assertEquals("LWa", name)
			assertEquals(8, tracks.length)
			
			tracks.get(0) => [
				assertEquals("1", name)
				assertSame(timetable.stations.get(0), station)
			]
		]
	}
}