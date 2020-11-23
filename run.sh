#!/bin/bash

xml=$1
runnum=$2

beast -beagle_GPU -seed 112358${runnum} -save_every 10000000 -save_stem ${xml}_run${runnum} $xml
