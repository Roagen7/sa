. ./common.sh

kill -9

rm $keystore_path/*
rm $truststore_path/*
rm $cert_path/*.cer

rmdir $keystore_path $truststore_path $cert_path
