# Package

version       = "0.1.2"
author        = "Konstantin Molchanov"
description   = "Advent of Code 2017 in Nim"
license       = "MIT"

bin = @["aoc2017"]
srcDir = "src"

when defined(Windows):
  binDir = "bin/windows"
elif defined(MacOSX):
  binDir = "bin/mac"
elif defined(Linux):
  binDir = "bin/linux"

# Dependencies

requires "nim >= 0.17.2", "docopt"
