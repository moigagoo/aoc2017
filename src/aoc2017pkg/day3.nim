import strutils, tables

type
  Position = tuple[i, j: int]
  Grid = Table[Position, int]

proc getCoverage(n: int): int = 2*n * (2*n + 1)

proc part1*(input: string): int =
  let input = parseInt(input)

  for i in 0..high(int):
    if getCoverage(i) >= input:
      let
        position = input - getCoverage(i-1) - 1
        (rightDown, rightUp, leftUp, leftDown) = (2*i-1, 4*i-2, 6*i-2, 8*i-3)

      var verticalDistance, horizontalDistance = 0

      if position in [rightDown, rightUp-1, leftUp+1, leftDown]:
        verticalDistance = i - 1
        horizontalDistance = i

      elif position in [rightUp, leftUp]:
        verticalDistance = i
        horizontalDistance = i

      elif position in 0..<rightDown:
        verticalDistance = i - 1
        horizontalDistance = abs(i-1-position)

      elif position in <rightDown..<rightUp-1:
        verticalDistance = abs(i-2-(position-rightDown-1))
        horizontalDistance = i

      elif position in <rightUp..<leftUp:
        verticalDistance = i
        horizontalDistance = abs(i-1-(position-rightUp-1))

      elif position in <leftUp+1..<leftDown:
        verticalDistance = abs(i-2-(position-leftUp-2))
        horizontalDistance = i

      return verticalDistance + horizontalDistance

proc getValue(grid: Grid, position: Position): int =
  for n in -1..1:
    for m in -1..1:
      if (n == 0) and (m == 0):
        continue
      result += grid.getOrDefault((position.i+n, position.j+m))

proc `+`(x, y: Position): Position = (x.i+y.i, x.j+y.j)

proc `+=`(x: var Position, y: Position) = x = (x.i+y.i, x.j+y.j)

template nextValue() {.dirty.} =
  currentPosition += deltas[i mod 4]
  currentValue = grid.getValue(currentPosition)
  if currentValue > input:return currentValue
  grid[currentPosition] = currentValue
  nextPosition = currentPosition + deltas[(i+1) mod 4]

proc part2*(input: string): int =
  let input = parseInt(input)

  var
    currentPosition, nextPosition: Position = (0, 0)
    deltas: array[0..3, Position] = [(1, 0), (0, 1), (-1, 0), (0, -1)]
    currentValue = 1
    grid: Grid = {currentPosition: currentValue}.toTable()
    i = 0

  while true:
    nextValue()

    while grid.getOrDefault(nextPosition) != 0:
      nextValue()

    inc i

proc test*() =
  doAssert part1("1") == 0
  doAssert part1("12") == 3
  doAssert part1("23") == 2
  doAssert part1("1024") == 31

  echo "All tests pass."
