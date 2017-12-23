import strutils, future


proc part1*(input: string): int =
  var
    input = lc[parseInt(line) | (line <- input.splitLines()), int]
    currentPosition = 0
    currentValue = input[currentPosition]

  while currentPosition in input.low..input.high:
    currentValue = input[currentPosition]
    inc input[currentPosition]
    currentPosition += currentValue
    inc result

proc test*() =
  doAssert part1("""0
3
0
1
-3""") == 5

  echo "All tests pass."
