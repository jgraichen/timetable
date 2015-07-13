package de.altimos.fremo.timetable.xpln

import de.altimos.fremo.timetable.basic.Timetable
import de.altimos.fremo.timetable.basic.Train
import java.net.URL
import java.nio.file.NoSuchFileException
import org.jopendocument.dom.ODPackage
import org.jopendocument.dom.spreadsheet.Sheet
import org.jopendocument.dom.spreadsheet.SpreadSheet
import org.jopendocument.dom.spreadsheet.Cell
import java.math.BigDecimal
import de.altimos.fremo.timetable.basic.Station
import de.altimos.fremo.timetable.basic.Track
import de.altimos.fremo.timetable.basic.TimetableEntry
import javax.xml.datatype.Duration

class Xpln {
	
	val timetable = new Timetable
	
	new () {
		
	}
	
	def load(URL file) {
		val in = file.openStream
		
		if(in == null) {
			throw new NoSuchFileException(file.toString)
		}
		
		SpreadSheet.get(new ODPackage(in)) => [
			getSheet("StationTrack", true) => [ loadStationTracks ]
			getSheet("Trains", true) => [ loadTrains ]
		]
		
		timetable
	}
	
	def private loadStationTracks(Sheet it) {
		(0 .. rowCount)
			.map[i| i -> getCellAt(5, i) ]
			.takeWhile[c| !(c.value.value as String).empty ]
			.forEach[c| loadStationTrackCell(c.key, c.value) ]
	}
	
	def private loadStationTrackCell(Sheet it, int rowIndex, Cell<SpreadSheet> cell) {
		switch cell.value {
			case "Station": {
				val name   = getCellAt(0, rowIndex).value.toString
				val remark = getCellAt(4, rowIndex).value.toString
				
				timetable.stations.add(new Station(name, remark))
			}
			case "Track": {
				val station = getCellAt(0, rowIndex).value.toString
				val name    = getCellAt(2, rowIndex).value.toString
				val remark  = getCellAt(7, rowIndex).value.toString
				
				timetable.stations.findFirst[s| s.name == station ] => [
					tracks.add(new Track(it, name, remark))
				]
			}
		}
	}
	
	def private loadTrains(Sheet it) {
		(0 .. rowCount)
			.map[i| i -> getCellAt(8, i) ]
			.takeWhile[c| !(c.value.value as String).empty ]
			.forEach[c| loadTrainCell(c.key, c.value) ]
	}
	
	def private loadTrainCell(Sheet it, int rowIndex, Cell<SpreadSheet> cell) {
		switch cell.value {
			case "traindef": {
				val number      = (getCellAt(0, rowIndex).value as BigDecimal).intValue
				val name        = getCellAt(9, rowIndex).value.toString
				val description = getCellAt(10, rowIndex).value.toString
				
				timetable.trains.add(new Train(number, name, description))
			}
			case "timetable": {
				val trainRef   = (getCellAt(0, rowIndex).value as BigDecimal).intValue
				val stationRef = getCellAt(2, rowIndex).value.toString
				val trackRef   = getCellAt(3, rowIndex).value.toString
				
				val arrival    = getCellAt(4, rowIndex).value as Duration
				val departure  = getCellAt(5, rowIndex).value as Duration
				val remark     = getCellAt(10, rowIndex).value.toString
				
				val train   = timetable.trains.findFirst[number == trainRef]
				val station = timetable.stations.findFirst[name == stationRef]
				val track   = station.tracks.findFirst[name == trackRef]
				
				val entry = new TimetableEntry(train, track, train.timetableEntries.length, arrival, departure, remark)
				
				train.timetableEntries.add(entry)
				station.timetableEntries.add(entry)
			}
		}
	}
}