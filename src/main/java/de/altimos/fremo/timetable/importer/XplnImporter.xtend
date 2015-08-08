package de.altimos.fremo.timetable.importer

import de.altimos.fremo.timetable.ITimetable
import de.altimos.fremo.timetable.Util
import de.altimos.fremo.timetable.basic.Station
import de.altimos.fremo.timetable.basic.Timetable
import de.altimos.fremo.timetable.basic.TimetableEntry
import de.altimos.fremo.timetable.basic.Track
import de.altimos.fremo.timetable.basic.Train
import java.net.URL
import java.nio.file.NoSuchFileException
import org.jopendocument.dom.ODPackage
import org.jopendocument.dom.spreadsheet.Cell
import org.jopendocument.dom.spreadsheet.Sheet
import org.jopendocument.dom.spreadsheet.SpreadSheet

import static extension de.altimos.fremo.timetable.TimetableExtensions.*

class XplnImporter {
	
	val timetable = new Timetable
	
	def ITimetable load(URL file) {
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
				val abbr = getCellAt(0, rowIndex).value.toString
				val name = getCellAt(4, rowIndex).value.toString
				
				val station = new Station => [
					it.name         = name
					it.abbreviation = abbr
				]
				
				timetable.add(station)
			}
			case "Track": {
				val abbr    = getCellAt(0, rowIndex).value.toString
				val name    = getCellAt(2, rowIndex).value.toString
				val remark  = getCellAt(7, rowIndex).value.toString
				val station = timetable.findStation(abbr) as Station
				
				val track = new Track => [
					it.name    = name
					it.remark  = remark
				]
				
				station.add(track)
			}
		}
	}
	
	def private loadTrains(Sheet sheet) {
		(0 .. sheet.rowCount)
			.map[ it -> sheet.getCellAt(8, it) ]
			.takeWhile[ !(value.value as String).empty ]
			.forEach[ sheet.loadTrainCell(key, value) ]
	}
	
	def private loadTrainCell(Sheet it, int rowIndex, Cell<SpreadSheet> cell) {
		switch cell.value {
			case "traindef": {
				val number = Integer.parseInt(getCellAt(0, rowIndex).value.toString)
				val name   = getCellAt(9, rowIndex).value.toString
				val remark = getCellAt(10, rowIndex).value.toString
				
				val train = new Train => [
					it.name = name
					it.number = number
					it.remark = remark
				]
				
				timetable.add(train)
			}
			case "timetable": {
				val trainNumber = Integer.parseInt(getCellAt(0, rowIndex).value.toString)
				val stationAbbr = getCellAt(2, rowIndex).value.toString
				val trackName   = getCellAt(3, rowIndex).value.toString
				val arrival     = Util.parseTime(getCellAt(4, rowIndex).value)
				val departure   = Util.parseTime(getCellAt(5, rowIndex).value)
				val remark      = getCellAt(10, rowIndex).value.toString

				val train   = timetable.findTrain(trainNumber) as Train
				val track   = timetable.findTrack(stationAbbr, trackName) as Track
				
				val timetableEntry = new TimetableEntry => [
					it.train = train
					it.track = track
					
					it.arrival = arrival
					it.departure = departure
					it.remark = remark
				]
				
				train.add(timetableEntry)
			}
		}
	}
}