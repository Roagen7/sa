
on error 
```
No appropriate protocol (protocol is disabled or cipher suites are inappropriate)
```
comment out jdk.tls.disabledAlgorithms in java.security file 
(on macos it's somewhere in ~/Library/Java/jdk)

running it on your system: 
```
export JADE_PASSWD=<specify your password>
./create_certs.sh
./run.sh
./run_backup.sh <num_of_backup_node>
./run_federated.sh <num_of_container>
```