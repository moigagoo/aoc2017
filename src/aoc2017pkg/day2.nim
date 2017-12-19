import strutils
import future


proc part1*(input: string): int =
  for line in input.splitLines():
    let items = lc[item.parseInt() | (item <- line.split()), int]

    var max, min = items[0]

    for item in items:
      if item > max:
        max = item
      if item < min:
        min = item

    result += (max - min)

proc test*() =
  doAssert part1("""5 1 9 5
7 5 3
2 4 6 8""") == 18

  echo "All tests pass."
