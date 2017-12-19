import strutils


proc part1*(input: string): int =
  for i, c in input:
    if c == input[(i+1) mod len(input)]:
      result += parseInt($c)

proc part2*(input: string): int =
  let
    halfLen = len(input) div 2

  for i, c in input:
    if c == input[(i+halfLen) mod len(input)]:
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

  echo "All tests pass."
