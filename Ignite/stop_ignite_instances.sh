#!/bin/bash

# Terminate all tmux sessions named "ignite"
tmux ls | grep -o "ignite[0-9]*" | while read -r session; do
    echo "Terminating tmux session: $session"
    tmux kill-session -t "$session"
done

echo "All Apache Ignite instances terminated"