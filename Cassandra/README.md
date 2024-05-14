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

### 1 node cluster 

```
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra1.yaml
```

### 3 nodes cluster

Execute the following commands on seperate shell processes
```
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra1.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra2.yaml
bin/cassandra -f -Dcassandra.config=file:///${PWD}/conf/cassandra3.yaml
```

### 7 nodes cluster

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
## FAQ for launching these instances

- Keep these different yaml files in seperate apache working directories because we also make minor edits to cassandra-env.sh file in ecah working directory
- i.e set JMX_PORT variable in each cassandra-env.sh file to a different port
- Main variales which are configured differently in these config files

  ```
  cluster_name: 'TestCluster' #Keep same value
  listen_address: 127.0.0.1 #IP address of each node, which is unique
  rpc_address: 0.0.0.0 
  broadcast_rpc_address: 127.0.0.1 #listen_address of each node
  native_transport_port: 9042 #Keep a unique value for each node
  seed_provider:
  - seeds: "127.0.0.1" #Same for all nodes
  ```


