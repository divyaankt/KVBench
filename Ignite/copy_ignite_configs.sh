#!/bin/bash

# Navigate to YCSB directory
cd ~/YCSB/ignite/resources/config

# Copy ignite.xml to Apache Ignite config directory
sudo cp ignite.xml ~/apache-ignite-2.7.0-bin/config

# Copy ignite-sql.xml to Apache Ignite config directory
sudo cp ignite-sql.xml ~/apache-ignite-2.7.0-bin/config

# Navigate to YCSB ignite-binding directory
cd ~/ycsb-0.17.0/ignite-binding/lib

# Copy ignite-binding-0.17.0.jar to Apache Ignite libs directory
sudo cp ignite-binding-0.17.0.jar ~/apache-ignite-2.7.0-bin/libs
