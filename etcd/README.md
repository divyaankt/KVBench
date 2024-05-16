# Etcd System

This folder contains the following details about the etcd key value store distributed system:
1. Installing etcd
2. Creating a local cluster with multiple instance of etcd
3. YCSB Benchmarking with etcd to analyse the throughput of workloads.

## Installing etdc
The below commands will install the etcd system into the machine. This also needs go to be installed.
```
sudo apt update
```
```
sudo apt install golang-go
```
Create a new directory
```
mkdir etcd
```

``` 
cd etcd/
 ```

 ``` 
 vi build.sh
  ```


Copy this contents below into the build.sh file :
``` 
ETCD_VER=v3.4.32

# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

/tmp/etcd-download-test/etcd --version
/tmp/etcd-download-test/etcdctl version 
```
This will download etcd in `/tmp/etcd-download-test` folder.

## Creating a local cluster with multiple etcd instances
The below is example for creating simple instance:
```
/tmp/etcd-download-test/etcd
```
 
The below is example for creating cluster with 3 instances :
```
/tmp/etcd-download-test/etcd --name=node1 --initial-advertise-peer-urls=http://localhost:2380 --listen-peer-urls=http://localhost:2380 --listen-client-urls=http://localhost:2379 --advertise-client-urls=http://localhost:2379 --initial-cluster=node1=http://localhost:2380,node2=http://localhost:2381,node3=http://localhost:2382 --initial-cluster-token=my-etcd-token
```
```
/tmp/etcd-download-test/etcd --name=node2 --initial-advertise-peer-urls=http://localhost:2381 --listen-peer-urls=http://localhost:2381 --listen-client-urls=http://localhost:2378 --advertise-client-urls=http://localhost:2378 --initial-cluster=node1=http://localhost:2380,node2=http://localhost:2381,node3=http://localhost:2382 --initial-cluster-token=my-etcd-token
```
```
/tmp/etcd-download-test/etcd --name=node3 --initial-advertise-peer-urls=http://localhost:2382 --listen-peer-urls=http://localhost:2382 --listen-client-urls=http://localhost:2377 --advertise-client-urls=http://localhost:2377 --initial-cluster=node1=http://localhost:2380,node2=http://localhost:2381,node3=http://localhost:2382 --initial-cluster-token=my-etcd-token
```
This will create 3 instances of etcd running on mentioned ports.

## YCSB Benchmarking

The below commands will first install the ycsb repo consisting of workloads which would be tested on TiKV. And this first needs to install go as a pre requisite.
```
git clone https://github.com/pingcap/go-ycsb.git --depth 1
 ```
 ```
cd go-ycsb/
```
```
make
```

This will make the setup done for YCSB and we can start running the workloads on etcd. Before that, we are currently making comparison for zipfian distribution, so for each workload in `workloads/` folder we need to change the distribution from uniform to zipfian.

Finally, the below commands will first load the workload with given parameters for configuring he workload and then run the workload. The result after running the workload will be printed in terminal and gives us the measurement of throughput for Reads/Writes/Inserts/Updates/Total etc.

For only single instance, we can use below :
```
bin/go-ycsb load etcd -P workloads/workloada -p operationcount=100000 -p recordcount=100000 -p threadcount=4
```
For multiple instances, we could specify the endpoints with `etcd.endpoints` parameter
```
bin/go-ycsb load etcd -P workloads/workloada -p operationcount=100000 -p recordcount=100000 -p threadcount=4 -p etcd.endpoints=http://localhost:2379,http://localhost:2378,http://localhost:2377 
```
```
bin/go-ycsb run etcd -P workloads/workloada -p operationcount=100000 -p recordcount=100000 -p threadcount=4 -p etcd.endpoints=http://localhost:2379,http://localhost:2378,http://localhost:2377 
```
