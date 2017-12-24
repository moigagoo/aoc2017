import strutils, future


proc part1*(input: string): int =
  var
    state = lc[parseInt(n) | (n <- input.splitWhitespace()), int]
    history: seq[seq[int]] = @[]
    maxValue, maxValueIndex: int

  while state notin history:
    history.add state

    maxValue = state.max
    maxValueIndex = state.find(maxValue)

    state[maxValueIndex] = 0

    for i in 1..maxValue:
      inc state[(maxValueIndex+i) mod len(state)]

    inc result

proc part2*(input: string): int =
  var
    state = lc[parseInt(n) | (n <- input.splitWhitespace()), int]
    history: seq[seq[int]] = @[]
    maxValue, maxValueIndex: int

  while state notin history:
    history.add state

    maxValue = state.max
    maxValueIndex = state.find(maxValue)

    state[maxValueIndex] = 0

    for i in 1..maxValue:
      inc state[(maxValueIndex+i) mod len(state)]

  result = len(history) - history.find state


proc test*() =
  doAssert part1("""0
2
7
0""") == 5
  doAssert part2("""0
2
7
0""") == 4
  echo "All tests pass."
