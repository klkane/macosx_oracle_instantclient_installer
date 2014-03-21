sudo mkdir -p /opt/oracle
sudo rm -rf /opt/oracle/instantclient
find ~/ | grep 'instantclient' | grep 'zip$' | xargs -L 1 sudo unzip -d /opt/oracle/
find /opt/oracle | grep 'sqlplus$' | sed s/sqlplus// | xargs -I {} -L 1 sudo ln -s {} /opt/oracle/instantclient
echo 'export DYLD_LIBRARY_PATH=/opt/oracle/instantclient' >> ~/.bash_profile
echo 'export PATH=/opt/oracle/instantclient:$PATH' >> ~/.bash_profile
echo 'export ORACLE_HOME=/opt/oracle/instantclient' >> ~/.bash_profile
find /opt/oracle | grep 'libclntsh' | xargs -I {} -L 1 sudo ln -s {} /opt/oracle/instantclient/libclntsh.dylib
