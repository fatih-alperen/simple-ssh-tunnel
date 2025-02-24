#!/bin/bash

# Path to store the process ID
PID_FILE="/tmp/socks_proxy.pid"

# Function to start the proxy
start_proxy() {
    echo "Starting SOCKS5 proxy..."
    ssh -D 1080 -N -q -C proxy &  # Runs in the background
    echo $! > "$PID_FILE"
    echo "Proxy started! You can close this terminal now."
}

# Function to stop the proxy
stop_proxy() {
    if [ -f "$PID_FILE" ]; then
        kill "$(cat "$PID_FILE")" && rm -f "$PID_FILE"
        echo "Proxy stopped."
    else
        echo "No running proxy found."
    fi
}

# Handle arguments
if [ "$1" == "close" ]; then
    stop_proxy
else
    start_proxy
fi
