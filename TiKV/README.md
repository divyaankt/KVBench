# TiKV System

This folder contains the following details about the TikV key value store distributed system:
1. Installing TiKV
2. Creating a local cluster with multiple instance of TiKV
3. YCSB Benchmarking with TiKV to analyse the throughput of workloads.

## Installing TiKV
The below three commands will install the TiKV system into the machine.
> curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh

> source ~/.bashrc

> tiup playground

If successfully installed, the above `tiup playground` should give start running a single TiKV instance.

## Creating a local cluster with multiple TiKV instances
The below command with start a cluster with the mentioned number of TiKV instances in a local cluster where `--kv` specifies about the number of TiKV instances and `--db.timeout` specifies about the timeout in sec for db.
> tiup playground --kv 3 --db.timeout 500

This should create 3 instances of TiKV in a single local cluster and start running.

## YCSB Benchmarking

The below commands will first install the ycsb repo consisting of workloads which would be tested on TiKV. And this first needs to install go as a pre requisite.
> sudo apt update
> sudo apt install golang-go
> git clone https://github.com/pingcap/go-ycsb.git --depth 1
> cd go-ycsb/
> make

This will make the setup done for YCSB and we can start running the workloads on TiKV. Before that, we are currently making comparison for zipfian distribution, so for each workload in `workloads/` folder we need to change the distribution from uniform to zipfian.

Finally, the below commands will first load the workload with given parameters for configuring he workload and then run the workload. The result after running the workload will be printed in terminal and gives us the measurement of throughput for Reads/Writes/Inserts/Updates/Total etc.
> bin/go-ycsb load tikv -P workloads/workloads -p operationcount=100000 -p recordcount=100000 -p threadcount=4 
> bin/go-ycsb run tikv -P workloads/workloads -p operationcount=100000 -p recordcount=100000 -p threadcount=4 

## Analysis
We have fixed the parameters `operationcount = 100000` ,  `recordcount = 100000` and `threadcount = 4` to make comparison across the systems.
The throughputs of each workload in YCSB is tested over TikV cluster having varying number of instances 1, 3, 5, 7.

The below graphs depicts all workloads Total while increasing the number of instances per TiKV cluster.

