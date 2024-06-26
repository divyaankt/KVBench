# KVBench

Through KVBench, we have performed reproducible, preliminary benchmarking of Apache Ignite, Apache Cassandra, TikV and etcd using YCSB[[1](https://github.com/brianfrankcooper/YCSB), [2](https://github.com/pingcap/go-ycsb)] workloads.

This work was done as a part of our Course Project for [CSE 590: Distributed and Decentralized Data Management](https://www3.cs.stonybrook.edu/~amiri/teaching/dddm/24s/index.html), taught by [Prof. Mohammad Javad Amiri](https://www3.cs.stonybrook.edu/~amiri/) at Stony Brook University in Spring 2024.

The benchmarks were performed on [CloudLab](https://www.cloudlab.us/)

## Platform Details
On CloudLab, we chose the following configuration for our server
1. Profile: ubuntu-22.04
2. Hardware Type: c220g2 (CloudLab Wisconsin)

## Server Specs
1. RAM: 157 GB
2. Swap Space: 8 GB
3. Disk Space: 63 GB
4. Number of CPUs: 40
5. Model Name: Intel(R) Xeon(R) CPU E5-2660 v3 @ 2.60GHz
6. Linux Kernel Version: 5.15.0-86-generic

(Note: For all KV stores evaluated, we spun up multi-node clusters on a single server itself.)

## YCSB Parameters
We have chosen the YCSB workload parameters to be the default ones: `operationcount = 100000` ,  `recordcount = 100000` and `threadcount = 4` to make comparison across the systems.

## Benchmark Setup and Results
To learn more about how to go ahead and perform the benchmarking results, checkout the links for the respective Key-Value stores. For a more detailed comparison and in-depth interpretation of the benchmarks, have a look at our attached Project report.

1. [Apache Ignite](https://github.com/divyaankt/KVBench/blob/main/Ignite/README.md)
2. [Apache Cassandra](https://github.com/divyaankt/KVBench/blob/main/Cassandra/README.md)
3. [etcd](https://github.com/divyaankt/KVBench/blob/main/etcd/README.md)
4. [TiKV](https://github.com/divyaankt/KVBench/blob/main/TiKV/README.md)
