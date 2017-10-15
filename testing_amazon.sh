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
spawn phoronix-test-suite merge-results 7zip-1 7zip-2 7zip-3 7zip-4 7zip-5 7zip-6 7zip-7 7zip-8 7zip-9 7zip-10
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
spawn phoronix-test-suite merge-results  gzip-1 gzip-2 gzip-3 gzip-4 gzip-5 gzip-6 gzip-7 gzip-8 gzip-9 gzip-10
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
spawn phoronix-test-suite merge-results stream-1 stream-2 stream-3 stream-4 stream-5 stream-6 stream-7 stream-8 stream-9 stream-10

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
spawn phoronix-test-suite merge-results phpbench-1 phpbench-2 phpbench-3 phpbench-4 phpbench-5 phpbench-6 phpbench-7 phpbench-8 phpbench-9 phpbench-10
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
spawn phoronix-test-suite merge-results apache-1 apache-2 apache-3 apache-4 apache-5 apache-6 apache-7 apache-8 apache-9 apache-10

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



####Create Csv Files
set count 10;
while {$count > 0 } {
  spawn phoronix-test-suite result-file-to-csv 7zip-$count
  interact
  set count [expr $count-1];
}

set count 10;
while {$count > 0 } {
  spawn phoronix-test-suite result-file-to-csv gzip-$count
  interact
  set count [expr $count-1];
}

set count 10;
while {$count > 0 } {
  spawn phoronix-test-suite result-file-to-csv stream-$count
  interact
  set count [expr $count-1];
}

set count 10;
while {$count > 0 } {
  spawn phoronix-test-suite result-file-to-csv phpbench-$count
  interact
  set count [expr $count-1];
}

spawn phoronix-test-suite result-file-to-csv iozone-0
interact

spawn phoronix-test-suite result-file-to-csv tiobench-benchmark
interact
