const doc = """
Advent of Code.

Usage:
  aoc2017 run --day=<day> --part=<part> <input>
  aoc2017 test --day=<day>
  aoc2017 (-h | --help)

Options:
  -h --help         Show this screen.
"""

import aoc2017pkg/[day1, day2, day3, day4, day5, day6, day7]
import strutils

import docopt


when isMainModule:
  let args = docopt(doc)

  if args["run"]:
    let
      day = parseInt($args["--day"])
      part = parseInt($args["--part"])
      input = $args["<input>"]
      answerLine = "The answer is $#."

    case day
    of 1:
      case part
      of 1: echo answerLine % $day1.part1(readFile(input))
      of 2: echo answerLine % $day1.part2(readFile(input))
      else: discard
    of 2:
      case part
      of 1: echo answerLine % $day2.part1(readFile(input))
      of 2: echo answerLine % $day2.part2(readFile(input))
      else: discard
    of 3:
      case part
      of 1: echo answerLine % $day3.part1(readFile(input))
      of 2: echo answerLine % $day3.part2(readFile(input))
      else: discard
    of 4:
      case part
      of 1: echo answerLine % $day4.part1(readFile(input))
      of 2: echo answerLine % $day4.part2(readFile(input))
      else: discard
    of 5:
      case part
      of 1: echo answerLine % $day5.part1(readFile(input))
      of 2: echo answerLine % $day5.part2(readFile(input))
      else: discard
    of 6:
      case part
      of 1: echo answerLine % $day6.part1(readFile(input))
      of 2: echo answerLine % $day6.part2(readFile(input))
      else: discard
    of 7:
      case part
      of 1: echo answerLine % $day7.part1(readFile(input))
      of 2: echo answerLine % $day7.part2(readFile(input))
      else: discard
    else: discard

  elif args["test"]:
    let day = parseInt($args["--day"])

    case day
    of 1: day1.test()
    of 2: day2.test()
    of 3: day3.test()
    of 4: day4.test()
    of 5: day5.test()
    of 6: day6.test()
    of 7: day7.test()
    else: discard
