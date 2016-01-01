package de.altimos.timetable.cli

import de.altimos.timetable.importer.XplnImporter
import de.altimos.timetable.serializer.BFOSerializer
import de.altimos.timetable.serializer.RgZmSerializer
import java.io.File
import java.io.FileWriter

class Main {
	def static void main(String[] args) {
		println(args.join(" "))
		
		if(args.empty) {
			printUsage
			System.exit(1)
		}
		
		if(args.get(0) == "convert") {
			if(args.length != 3) {
				System.err.println("Invalid number of parameters.")
				System.exit(1)
			}
			
			print("Load XPLN... ")
			val input     = new File(args.get(1))
			val timetable = new XplnImporter().load(input.toURI.toURL)
			println("[done]")
			
			val folder = new File(args.get(2))
			if(!folder.directory && !folder.mkdirs()) {
				System.err.println("Could not created directory: " + folder.path)
				System.exit(1)
			}
			
			val cfg = new File(folder, input.name + ".rgzm")
			new FileWriter(cfg) => [
				write(new RgZmSerializer().serialize(timetable))
				close
			]
			
			timetable.stations.forEach[station|
				val file = new File(folder, station.abbreviation + '.bfo')
				new FileWriter(file) => [
					write(new BFOSerializer().serialize(station))
					close
				]
			]
			
		} else {
			System.err.println("Unknown command: " + args.get(0))
			System.exit(1)
		}
	}
	
	def static void printUsage() {
		println("Usage: ./bin/timetable convert <xpln-file> <bfo-output-directory>")
	}
}