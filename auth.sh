. ./common.sh

MY_IP=192.168.1.108 ## !!! Change this 
if [[ "$MY_PORT" == "" ]]; then
    MY_PORT=5500
fi


MAIN_IP=192.168.1.108
MAIN_PORT=5500


run_main(){
java \
-Djavax.net.ssl.keyStore="${keystore_path}/m1" -Djavax.net.ssl.keyStorePassword=$all_pass \
-Djavax.net.ssl.trustStore="${truststore_path}/trust_all" \
-cp $jade_path jade.Boot -gui -nomtp \
-icps jade.imtp.leap.JICP.JICPSPeer -container-name "m1" \
-host $MAIN_IP -port $MAIN_PORT -local-host $MY_IP -local-port $MY_PORT \
-services jade.core.replication.MainReplicationService\;jade.core.replication.AddressNotificationService
}

run_backup(){
java \
-Djavax.net.ssl.keyStore="${keystore_path}/m${1}" -Djavax.net.ssl.keyStorePassword=$all_pass \
-Djavax.net.ssl.trustStore="${truststore_path}/trust_all" \
-cp $jade_path jade.Boot -nomtp \
-host $MAIN_IP -port $MAIN_PORT -local-host $MY_IP -local-port $MY_PORT \
-icps jade.imtp.leap.JICP.JICPSPeer -container-name "m${1}" -backupmain \
-services jade.core.replication.MainReplicationService\;jade.core.replication.AddressNotificationService
}

run_container(){
java \
-Djavax.net.ssl.keyStore="${keystore_path}/f${1}" -Djavax.net.ssl.keyStorePassword=$all_pass \
-Djavax.net.ssl.trustStore="${truststore_path}/trust_all" \
-cp $jade_path jade.Boot -container -nomtp -host localhost \
-host $MAIN_IP -port $MAIN_PORT -local-host $MY_IP -local-port $MY_PORT \
-icps jade.imtp.leap.JICP.JICPSPeer -container-name "f${1}"
}
