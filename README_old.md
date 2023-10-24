
running it on your system: 
```sh
# generate keys
./gen_certs.sh

#load functions and envs
. ./auth.sh

#set envs
MY_IP=yourip
MAIN_IP=yourip

run_main m
```

```sh
#load functions and envs
. ./auth.sh

#set envs
MY_IP=yourip
MAIN_IP=mainip

run_backup m2
```