# encrypted run, no auth, between 2 containers
. ./common.sh

kill -9

mkdir $keystore_path $truststore_path $cert_path

rm $keystore_path/*
rm $truststore_path/*
rm $cert_path/*.cer
gen main 0
gen container1 1
gen container2 2

import container1 0
import container2 0

import main 1
import container2 1

import main 2
import container1 2

#run_main main 0 0
#run_container container1 1 1

# java -cp lib/jade.jar jade.Boot -host localhost -port 5555 -local-host localhost -local-port 5555 -nomtp -icps jade.imtp.leap.JICP.JICPSPeer

