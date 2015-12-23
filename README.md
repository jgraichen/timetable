# timetable

Small utility to convert XPLN timetables to RgZm/BFO.

## Usage

```
./bin/timetable convert <xpln> <output>
```

This will create a RgZm configuration file and a BFO for each station based on given `<xpln>` file in `<output>` directory.

On Windows you can use `timetable.bat`. As of now this tool is CLI only.

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

Extract zip from `build/distributions/` to whereever you want to install it.

## TODO

* RgZm configuration file does not (yet) contain track layout.
* UI?

## Contribute

Primarily written in Xtend using Eclipse. Run `gradle eclipse` to generate eclipse project files.

## License

Copyright 2015 Jan Graichen <jgraichen@altimos.de>

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
