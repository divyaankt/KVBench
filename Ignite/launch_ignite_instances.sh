#!/bin/bash

# Check if the number of instances argument is provided
if [ $# -ne 1 ]; then
        echo "Usage: $0 <number_of_instances>"
        exit 1
fi

# Number of instances to start
num_instances=$1

# Start each Ignite instance in a new tmux session
for ((i=1; i<=$num_instances; i++)); do
        echo "Starting Ignite instance $i in a new tmux session"

        # Create a new session named "ignite$i", and run command
        tmux new-session -d -s "ignite$i"
        tmux send-keys -t "ignite$i" "~/apache-ignite-2.7.0-bin/bin/ignite.sh ~/apache-ignite-2.7.0-bin/config/ignite.xml" Enter
        tmux detach -s "ignite$i"
        sleep 2
done