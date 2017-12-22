import strutils, tables


proc isValid(passphrase: string): bool =
  result = true

  var counter = initCountTable[string]()

  for word in splitWhitespace(passphrase):
    counter.inc word
    if counter[word] > 1:
      return false

proc part1*(input: string): int =
  for line in input.splitLines():
    if line.isValid:
      inc result

proc test*() =
  doAssert "aa bb cc dd ee".isValid == true
  doAssert "aa bb cc dd aa".isValid == false
  doAssert "aa bb cc dd aaa".isValid == true

  echo "All tests pass."
