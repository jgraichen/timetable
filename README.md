# timetable

[![Build Status](https://travis-ci.org/jgraichen/timetable.svg?branch=master)](https://travis-ci.org/jgraichen/timetable)

Collection of libraries and tools to work with timetables.

## timetable-cli

Small command line utility to convert XPLN timetables to RgZm/BFO.

### Usage

```
./bin/timetable-cli convert <xpln> <output>
```

This will create a RgZm configuration file and a BFO for each station based on given `<xpln>` file in `<output>` directory.

On Windows you can use `timetable-cli.bat`.

## timetable-core

Shared library for loading and working with timetables, routes, stations, tracks and trains.

## Compile

Requirements:

* JDK
* Gradle

Clone repository and run gradle:

```
git clone https://github.com/jgraichen/timetable
cd timetable
gradle distZip
```

Extract zip from `<project>/build/distributions/`.

## TODO

* RgZm configuration file does not (yet) contain track layout.
* UI?

## Contribute

Primarily written in Xtend using Eclipse. Run `gradle eclipse` to generate eclipse project files.

## License

Copyright 2015-2017 Jan Graichen

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
