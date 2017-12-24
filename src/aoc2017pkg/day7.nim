import strutils, strscans, future


proc part1*(input: string): string =
  var programsWithChildren, programsThatAreChildren: seq[string] = @[]

  for line in input.splitLines():
    var
      name: string
      weight: int
      children: seq[string] = @[]

    let components = line.split(" -> ")

    discard scanf(line, "$w ($i)", name, weight)

    if components.len > 1:
      children = components[1].split(", ")
      programsWithChildren.add name
      programsThatAreChildren.add children

  result = lc[program | (program <- programsWithChildren, program notin programsThatAreChildren),
            string][0]


proc test*() =
  doAssert part1("""pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)""") == "tknk"

  echo "All tests pass."
