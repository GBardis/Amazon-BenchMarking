GNU nano 2.5.3                                                        File: amazon_bench.sh                                                                                                            Modified

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
spawn  phoronix-test-suite install pts/stream-1.2.0
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
spawn phoronix-test-suite merge-results 7zip-1 7zip-2 7zip-2 7zip-3 7zip-4 7zip-5 7zip-6 7zip-7 7zip-8 7zip-9 7zip-10
set count 10;
while {$count > 0 } {
  spawn phoronix-test-suite batch-benchmark pts/compress-gzip

  expect "Enter a name to save these results under:"
  send "Gzip $count\r"
  expect "Enter a unique name to describe this test run / configuration:"
  send "$count Time\r"
  expect "New Description:"
  send "$count Time\r"
  interact
  set count [expr $count-1];
}
spawn phoronix-test-suite merge-results  Gzip-1 Gzip-2 Gzip-3 Gzip-4 Gzip-5 Gzip-6 Gzip-7 Gzip-8 Gzip-9 Gzip-10
set count 10;
while {$count > 0 } {
  spawn phoronix-test-suite batch-benchmark pts/stream-1.2.0

  expect "Enter a name to save these results under:"
  send "Stream $count\r"
  expect "Enter a unique name to describe this test run / configuration:"
  send "$count Time\r"
  expect "New Description:"
  send "$count Time\r"
  interact
  set count [expr $count-1];
}
spawn phoronix-test-suite merge-results Stream-1 Stream-2 Stream-3 Stream-4 Stream-5 Stream-6 Stream-7 Stream-8 Stream-9 Stream-10

set count 10;

while {$count > 0 } {
  spawn phoronix-test-suite batch-benchmark pts/phpbench

  expect "Enter a name to save these results under:"
  send "PhpBench $count\r"
  expect "Enter a unique name to describe this test run / configuration:"
  send "$count Time\r"
  expect "New Description:"
  send "$count Time\r"
  interact
  set count [expr $count-1];
}
spawn phoronix-test-suite merge-results PhpBench-1 PhpBench-2 PhpBench-3 PhpBench-4 PhpBench-5 PhpBench-6 PhpBench-7 PhpBench-8 PhpBench-9 PhpBench-10
set count 10;

while {$count > 0 } {
  spawn phoronix-test-suite batch-benchmark pts/apache

  expect "Enter a name to save these results under:"
  send "Apache $count\r"
  expect "Enter a unique name to describe this test run / configuration:"
  send "$count Time\r"
  expect "New Description:"
  send "$count Time\r"
  interact
  set count [expr $count-1];
}
spawn phoronix-test-suite merge-results Apache-1 Apache-2 Apache-3 Apache-4 Apache-5 Apache-6 Apache-7 Apache-8 Apache-9 Apache-10

spawn phoronix-test-suite batch-benchmark pts/iozone
expect "Enter a name to save these results under:"
send "Iozone $count\r"
expect "Enter a unique name to describe this test run / configuration:"
send "$count Time\r"
expect "New Description:"
send "$count Time\r"
interact

spawn phoronix-test-suite batch-benchmark pts/tiobench
expect "Enter a name to save these results under:"
send "TioBench $count\r"
expect "Enter a unique name to describe this test run / configuration:"
send "$count Time\r"
expect "New Description:"
send "$count Time\r"
interact
