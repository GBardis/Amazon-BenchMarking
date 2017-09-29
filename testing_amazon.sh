#!/bin/bash
set count 10;

while {$count > 0 } {
  phoronix-test-suite batch-benchmark pts/compress-7zip

  expect "Enter a name to save these results under:"
  send "7zip $count\r"
  expect "Enter a unique name to describe this test run / configuration:"
  send "$count Time\r"
  expect "New Description:"
  send "$count Time\r"
  interact
  set count [expr $count-1];
}
