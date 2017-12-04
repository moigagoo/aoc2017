import strutils


proc part1*(input: string): int =
  let inputLine = readFile(input)

  for i, c in inputLine:
    if c == inputLine[(i+1) mod len(inputLine)]:
      result += parseInt($c)


proc part2*(input: string): int =
  let
    inputLine = readFile(input)
    halfLen = len(inputLine) div 2

  for i, c in inputLine:
    if c == inputLine[(i+halfLen) mod len(inputLine)]:
      result += parseInt($c)


proc test*() =
  doAssert part1("1122") == 3
  doAssert part1("1111") == 4
  doAssert part1("1234") == 0
  doAssert part1("91212129") == 9

  doAssert part2("1212") == 6
  doAssert part2("1221") == 0
  doAssert part2("123425") == 4
  doAssert part2("123123") == 12
  doAssert part2("12131415") == 4

  echo "All tests passed."
