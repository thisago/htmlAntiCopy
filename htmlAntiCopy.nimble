# Package

version       = "0.1.1"
author        = "Thiago Navarro"
description   = "Block copy of any text in HTML"
license       = "MIT"
srcDir        = "src"

installExt = @["nim"]
binDir = "build"
bin = @["htmlAntiCopy"]


# Dependencies

requires "nim >= 1.5.1"

task buildRelease, "Build the release version":
  exec "nimble -d:release build"
task buildJs, "Build the release js version":
  switch("backend", "js")
  exec "nim js -d:release --out:build/ src/htmlAntiCopy.nim"
