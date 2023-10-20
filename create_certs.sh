mkdir -p certs
mkdir -p certs/keystores
mkdir -p certs/exported
mkdir -p certs/truststores

# ---- key generation ----
# create key container for main container
keytool -dname "cn=Unknown, ou=Unknown, o=Unknown, c=Unknown" -genkey -keystore certs/keystores/main.jks -alias main -keyalg RSA -storepass changeit 

# create key container for federated
keytool -dname "cn=Unknown, ou=Unknown, o=Unknown, c=Unknown" -genkey -keystore certs/keystores/fed.jks -alias fed -keyalg RSA -storepass changeit 

 # create key container for backup
keytool -dname "cn=Unknown, ou=Unknown, o=Unknown, c=Unknown" -genkey -keystore certs/keystores/bac.jks -alias bac -keyalg RSA -storepass changeit 

# ---- certificate creation ----
keytool -export -rfc -keystore certs/keystores/main.jks -alias main -file certs/exported/main.cer -storepass changeit
keytool -export -rfc -keystore certs/keystores/fed.jks -alias fed -file certs/exported/fed.cer -storepass changeit
keytool -export -rfc -keystore certs/keystores/bac.jks -alias bac -file certs/exported/bac.cer -storepass changeit

# ---- import certificates ----

keytool -import -file certs/exported/main.cer -alias main -keystore certs/truststores/fed.jks -storepass changeit -noprompt


keytool -import -file certs/exported/fed.cer -alias fed -keystore certs/truststores/main.jks -storepass changeit -noprompt

# keytool -import -file certs/exported/main.cer -alias main -keystore certs/truststores/bac.jks -storepass changeit

# fed certificate
# keytool -import -file certs/exported/fed.cer -alias fed -keystore certs/truststores/main.jks -storepass changeit -noprompt
# keytool -import -file certs/exported/fed.cer -alias fed -keystore certs/truststores/bac.jks -storepass changeit -noprompt

# bac certificate
# keytool -import -file certs/exported/bac.cer -alias bac -keystore certs/truststores/main.jks -storepass changeit -noprompt
# keytool -import -file certs/exported/bac.cer -alias bac -keystore certs/truststores/fed.jks -storepass changeit -noprompt
