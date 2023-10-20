MY_IP=192.168.0.28
PORT=5656
LOGGING=log/main_container.log

nohup java -Djavax.net.ssl.keyStore=certs/keystores/main.jks -Djavax.net.ssl.trustStore=certs/truststores/main.jks -Djavax.net.ssl.keyStorePassword=changeit -cp jade.jar jade.Boot \
    -host $MY_IP -port $PORT \
    -local-host $MY_IP -local-port $PORT \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -gui \
    -services \
    jade.core.replication.MainReplicationService\;\
    jade.core.replication.AddressNotificationService > $LOGGING 2>&1 &
 