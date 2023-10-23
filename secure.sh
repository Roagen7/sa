. ./common.sh

run_main(){
java \
-cp $jade_path jade.Boot -gui -nomtp \
-icps jade.imtp.leap.JICP.JICPSPeer\(5500\) -container-name "jade-main"
}

run_container(){
java \
-cp $jade_path jade.Boot -container -nomtp -port 5500 -host localhost \
-icps jade.imtp.leap.JICP.JICPSPeer -container-name "jade-container1"
}
