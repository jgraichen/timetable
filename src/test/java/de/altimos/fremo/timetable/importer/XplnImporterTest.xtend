package de.altimos.fremo.timetable.importer

import de.altimos.fremo.timetable.ITimetable
import org.jopendocument.util.TimeUtils
import org.junit.Test

import static org.junit.Assert.*

class XplnImporterTest {
	
	var static ITimetable _timetable
	
	def static getTimetable() {
		if(_timetable == null) {
			_timetable = new XplnImporter().load(XplnImporterTest.getResource("large_xpln.ods"))	
		}
		
		_timetable
	}
	
	@Test
	def void testTrainDefParse() {
		assertEquals(86, timetable.trains.length)
		
		timetable.trains.get(0) => [
			assertEquals(61, number)
			assertEquals("FD 61", name)
			assertEquals("Fernschnellzug Görlitz–Leipzig–Frankfurt/Main", remark)
		]
	}
	
	@Test
	def void testTimetableParse() {
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
				assertEquals("Gr", track.station.abbreviation)
				
				assertSame(null, prev)
				assertSame(te.get(1), next)
			]
		]
	}
	
	@Test
	def void testStationParse() {
		assertEquals(16, timetable.stations.length)
		
		timetable.stations.get(0) => [
			assertEquals("LWa", abbreviation)
			assertEquals("Leipzig-Wahren", name)
		]
	}
	
	@Test
	def void testStationTrackParse() {
		assertEquals(16, timetable.stations.length)
		
		timetable.stations.get(0) => [
			assertEquals("LWa", abbreviation)
			assertEquals(8, tracks.length)
			
			tracks.get(0) => [
				assertEquals("1", name)
				assertSame(timetable.stations.get(0), station)
			]
		]
	}
	
	@Test
	def void testTimetableEntryNextPrev() {
		assertTrue(timetable.trains.length > 0)
		
		timetable.trains.get(0) => [
			assertTrue(name == "FD 61")
			
			val tes = timetableEntries
			assertTrue(tes.length >= 3)
			
			tes.get(1) => [
				assertSame(tes.get(0), prev)
				assertSame(tes.get(2), next)
			]
		]
	}
	
	@Test
	def void testRouteParsing() {
		assertTrue(timetable.stations.length > 0)
		
		val grl = timetable.stations.findFirst[abbreviation == "Gr"]
		val jwz = timetable.stations.findFirst[abbreviation == "Jwz"]
		
		assertEquals(1, grl.routes.length)
		assertEquals(3, jwz.routes.length)
		
		val route = jwz.routes.findFirst[destination == grl]
		
		assertSame(route, grl.routes.get(0))
		
		route => [
			assertSame(jwz, station)
			assertSame(grl, destination)
			assertEquals(80, speedLimit)
			assertEquals(7, travelDuration)
		]
	}
}