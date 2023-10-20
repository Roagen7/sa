MY_IP=192.168.0.28
PORT=5656
BACKUP_PORT=4646
LOGGING="log/back_container_$1.log"

nohup java -cp jade.jar jade.Boot \
    -host $MY_IP -port $PORT \
    -local-host $MY_IP -local-port $BACKUP_PORT \
    -backupmain \
    -nomtp -icps jade.imtp.leap.JICP.JICPSPeer \
    -services \
    jade.core.replication.MainReplicationService\;\
    jade.core.replication.AddressNotificationService > $LOGGING 2>&1 &
    
