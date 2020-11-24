#!/bin/bash

args=($@)
xml=${args[0]}
runnum=${args[1]}

beast -beagle_GPU -seed 112358${runnum} -save_every 10000000 -save_stem ${xml}_run${runnum} $xml
