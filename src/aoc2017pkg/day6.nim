import strutils, future


proc part1*(input: string): int =
  var
    state = lc[parseInt(n) | (n <- input.splitWhitespace()), int]
    history: seq[seq[int]] = @[]
    maxValue, maxValueIndex: int

  while not (state in history):
    history.add state

    maxValue = state.max
    maxValueIndex = state.find(maxValue)

    state[maxValueIndex] = 0

    for i in 1..maxValue:
      inc state[(maxValueIndex+i) mod len(state)]

    inc result


proc test*() =
  doAssert part1("""0
2
7
0""") == 5
  echo "All tests pass."
