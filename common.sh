all_pass='pass123'
jade_path="./jade.jar"
keystore_path="./keystore"
truststore_path="./truststore"
cert_path="./cert"

gen(){
	pass=$all_pass
	keystore_pass=$all_pass
	keytool -genkey -alias $"jade-${1}" -keyalg RSA -keystore "${keystore_path}/${2}" -storetype JKS  -keypass $pass -storepass $keystore_pass -dname "CN=Giada,OU=JADE,O=FooBarLtd,L=Naples,ST=na,C=IT"
	keytool -export -keystore "${keystore_path}/${2}" -storepass $keystore_pass -storetype JKS -alias "jade-${1}" -rfc -file "${cert_path}/${1}.cer"
}

import(){
	truststore_pass=$all_pass
	keytool -import -keystore "${truststore_path}/${2}" -storepass $truststore_pass -storetype JKS -alias "jade-${1}" -file "${cert_path}/${1}.cer" -noprompt 
}

run_main(){
java \
-Djavax.net.ssl.keyStore="${keystore_path}/${2}" -Djavax.net.ssl.keyStorePassword=$all_pass \
-Djavax.net.ssl.trustStore="${truststore_path}/${3}" \
-cp $jade_path jade.Boot -gui -nomtp \
-icps jade.imtp.leap.JICP.JICPSPeer\(5500\) -container-name "jade-${1}"
}

run_container(){
java \
-Djavax.net.ssl.keyStore="${keystore_path}/${2}" -Djavax.net.ssl.keyStorePassword=$all_pass \
-Djavax.net.ssl.trustStore="${truststore_path}/${3}" \
-cp $jade_path jade.Boot -container -nomtp -port 5500 -host localhost \
-icps jade.imtp.leap.JICP.JICPSPeer -container-name "jade-${1}"
}

