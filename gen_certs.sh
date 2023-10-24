# encrypted run, no auth, between 2 containers
. ./prune_cert.sh


mkdir $keystore_path $truststore_path $cert_path

mains=( m1 m2 m3 )
federated=( f1 f2 f3 )
all=( m1 m2 m3 f1 f2 f3 )
# create private public key in keystore
# gen additionaly extract public key and save it in cert folder
for key in "${all[@]}"
do
    gen $key $key
done

for key in "${all[@]}"
do
    # trust every one that have cert in cert folder
    import_trust $key trust_all
    for main in "${mains[@]}"
    do
        if [[ $main != $key ]]; then
            # add public keys of main and backups (to start ssh session)
            import_keystore $main $key
        fi
    done 
done

#run_main main 0 0
#run_container container1 1 1

# java -cp lib/jade.jar jade.Boot -host localhost -port 5555 -local-host localhost -local-port 5555 -nomtp -icps jade.imtp.leap.JICP.JICPSPeer

