#[
  Created at: 09/02/2021 17:20:13 Thursday
  Modified at: 09/02/2021 07:52:38 PM Thursday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

from std/random import sample, rand, randomize
from std/strutils import IdentChars, Letters
from std/strformat import fmt

const
  textElement = "span"
  charElement = "i"

type
  ShuffledText* = tuple
    text, class, css: string

func genCss(class: string, fakeCharsIndex: openArray[int]): string =
  for i in fakeCharsIndex:
    result.add fmt"{textElement}.{class} {charElement}:nth-child({i}),"
  if result[^1] == ',':
    result = result[0..^2]
  result.add "{font-size:0px;}"
  result.add fmt"{textElement}.{class} {charElement}"
  result.add "{font-style: unset;}"

randomize()

const FakeChars = IdentChars + {' '}

proc shuffle*(text: string; shuffleLevel = 1): ShuffledText =
  var
    fakeWordsIndex: seq[int]
  for _ in 0..rand 10..20:
    result.class.add sample IdentChars
  while result.class[0] notin Letters:
    result.class = result.class[1..^1]
  for ch in text:
    result.text.add ch
    while rand(0..shuffleLevel) > 0:
      result.text.add sample FakeChars
      fakeWordsIndex.add result.text.len
  result.css = result.class.genCss fakeWordsIndex

func toHtml*(self: ShuffledText): string =
  var text = ""
  for ch in self.text:
    text.add fmt"<{charElement}>{ch}</{charElement}>"
  result = fmt"""<style>{self.css}</style><{textElement} class="{self.class}">{text}</{textElement}>"""

proc antiCopy*(text: cstring; shuffleLevel = 1): cstring {.exportc.} =
  shuffle($text, shuffleLevel).toHtml.cstring

when isMainModule and not defined js:
  echo "Hello World".shuffle.toHtml
