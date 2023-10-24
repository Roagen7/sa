all_pass='pass123'
jade_path="./jade.jar"
keystore_path="./keystore"
truststore_path="./truststore"
cert_path="./cert"

gen(){
	pass=$all_pass
	keystore_pass=$all_pass
	keytool -genkey -alias "${1}" -keyalg RSA -keystore "${keystore_path}/${2}" -storetype JKS  -keypass $pass -storepass $keystore_pass -dname "CN=Giada,OU=JADE,O=FooBarLtd,L=Naples,ST=na,C=IT"
	keytool -export -keystore "${keystore_path}/${1}" -storepass $keystore_pass -storetype JKS -alias "${1}" -rfc -file "${cert_path}/${1}.cer"
}

import_trust(){
	truststore_pass=$all_pass
	keytool -import -keystore "${truststore_path}/${2}" -storepass $truststore_pass -storetype JKS -alias "${1}" -file "${cert_path}/${1}.cer" -noprompt 2> /dev/null
}

import_keystore(){
	keystore_pass=$all_pass
	keytool -import -keystore "${keystore_path}/${2}" -storepass $keystore_pass -storetype JKS -alias "${1}" -file "${cert_path}/${1}.cer" -noprompt 2> /dev/null
}