import strutils, tables, hashes

proc hasNoDuplicateWords(passphrase: string): bool =
  result = true

  var counter = initCountTable[string]()

  for word in passphrase.splitWhitespace():
    counter.inc word
    if counter[word] > 1:
      return false

proc part1*(input: string): int =
  for line in input.splitLines():
    if line.hasNoDuplicateWords:
      inc result

proc hash(counter: CountTable[char]): Hash =
  for c in counter.keys:
    result = result !& ord(c)

  result = !$result

proc hasNoAnagrams(passphrase: string): bool =
  result = true

  var counter = initCountTable[CountTable[char]]()

  for word in passphrase.splitWhitespace():
    var charCounter = initCountTable[char]()

    for c in word:
      charCounter.inc c

    counter.inc charCounter
    if counter[charCounter] > 1:
      return false

proc part2*(input: string): int =
  for line in input.splitLines():
    if line.hasNoAnagrams:
      inc result

proc test*() =
  doAssert "aa bb cc dd ee".hasNoDuplicateWords
  doAssert "aa bb cc dd aa".hasNoDuplicateWords == false
  doAssert "aa bb cc dd aaa".hasNoDuplicateWords

  doAssert "abcde fghij".hasNoAnagrams
  doAssert "abcde xyz ecdab".hasNoAnagrams == false
  doAssert "a ab abc abd abf abj".hasNoAnagrams
  doAssert "iiii oiii ooii oooi oooo".hasNoAnagrams
  doAssert "oiii ioii iioi iiio".hasNoAnagrams == false

  echo "All tests pass."
