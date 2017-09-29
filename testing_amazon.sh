#!/usr/bin/expect
spawn apt update -y
interact
spawn apt install phoronix-test-suite -y
interact
spawn apt-get install php7.0-zip -y
interact apt-cache search php7.0-*
spawn phoronix-test-suite install pts/compress-7zip
interact
spawn phoronix-test-suite install pts/compress-gzip
interact
spawn phoronix-test-suite install pts/tiobench
interact
spawn phoronix-test-suite install pts/iozone
interact
spawn phoronix-test-suite install pts/phpbench
interact
spawn phoronix-test-suite install pts/apache
interact
spawn  phoronix-test-suite install pts/stream
interact

spawn phoronix-test-suite batch-setup
expect "Save test results when in batch mode (Y/n):"
send "y\r"
expect "Open the web browser automatically when in batch mode (y/N):"
send "n\r"
expect "Auto upload the results to OpenBenchmarking.org (Y/n):"
send "n\r"
expect "Prompt for test identifier (Y/n):"
send "y\r"
expect "Prompt for test description (Y/n):"
send "y\r"
expect "Prompt for saved results file-name (Y/n):"
send "y\r"
expect "Run all test options (Y/n):"
send "y\r"

set count 10;

while {$count > 0 } {
  spawn phoronix-test-suite batch-benchmark pts/compress-7zip

  expect "Enter a name to save these results under:"
  send "7zip $count\r"
  expect "Enter a unique name to describe this test run / configuration:"
  send "$count Time\r"
  expect "New Description:"
  send "$count Time\r"
  interact
  set count [expr $count-1];
}
