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

proc part2*(input: string): int =
  for line in input.splitLines():
    block processLine:
      let items = lc[item.parseInt() | (item <- line.split()), int]

      for i, n in items:
        for m in items[i+1..^1]:
          if n mod m == 0:
            result += n div m
          elif m mod n == 0:
            result += m div n
            break processLine

proc test*() =
  doAssert part1("""5 1 9 5
7 5 3
2 4 6 8""") == 18

  doAssert part2("""5 9 2 8
9 4 7 3
3 8 6 5""") == 9

  echo "All tests pass."
