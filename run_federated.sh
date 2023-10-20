MY_IP=192.168.0.28
PORT=5656
BACKUP_PORT=4646
LOGGING="log/fed_container_$1.log"

nohup java  -Djavax.net.ssl.keyStore=certs/keystores/fed.jks -Djavax.net.ssl.trustStore=certs/truststores/fed.jks -Djavax.net.ssl.keyStorePassword=changeit -cp jade.jar jade.Boot \
    -host $MY_IP -port $PORT \
    -local-host $MY_IP -local-port $BACKUP_PORT \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -container \
    -services \
    jade.core.replication.AddressNotificationService > $LOGGING 2>&1 &
 
