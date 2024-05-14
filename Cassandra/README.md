# Apache Cassandra

## Installing Cassandra

Make sure you have openjdk 11 or higher in the system

```
sudo apt update
sudo apt install openjdk-11-jdk
java -version
```

```
curl -OL http://apache.mirror.digitalpacific.com.au/cassandra/4.0.0/apache-cassandra-4.1.4-bin.tar.gz
tar xzvf apache-cassandra-4.0.0-bin.tar.gz
```

## Steps to launch 1,3,5,7 Cassandra nodes in a single cluster on a VM

You can find the respective config files in the config directory

### 1 node

```
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra1.yaml
```

### 3 nodes

Execute the following commands on seperate shell processes
```
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra1.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra2.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra3.yaml
```

### 7 nodes

Execute the following commands on seperate shell processes
```
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra1.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra2.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra3.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra4.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra5.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra6.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra7.yaml
```

