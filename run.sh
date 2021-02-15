#!/bin/bash

source ~/.bashrc

args=($@)
xml=${args[0]}
runnum=${args[1]}
gpunum=${args[2]}

java -Djava.library.path="/usr/local/lib:/root/lib" -Xms2G -Xmx4G -jar /usr/local/lib/beast.jar -beagle_GPU -beagle_order ${gpunum} -seed 112358${runnum} -save_every 10000000 -save_stem ${xml}_run${runnum} $xml
