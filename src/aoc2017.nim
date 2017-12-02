const doc = """
Advent of Code.

Usage:
  aoc2017 run --day=<day> --part=<part> <input>
  aoc2017 test --day=<day>
  aoc2017 (-h | --help)

Options:
  -h --help         Show this screen.
"""

import aoc2017pkg/day1
import strutils

import docopt


when isMainModule:
  let args = docopt(doc)

  if args["run"]:
    let
      day = parseInt($args["--day"])
      part = parseInt($args["--part"])
      input = $args["<input>"]
      answerLine = "The answer is $#"

    case day
    of 1:
      case part
      of 1: echo answerLine % $day1.part1(input)
      of 2: echo answerLine % $day1.part2(input)
      else: discard
    else: discard

  elif args["test"]:
    let day = parseInt($args["--day"])

    case day
    of 1: day1.test()
    else: discard
