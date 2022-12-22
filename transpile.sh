#!/bin/bash

# Run the transpiler in the background
lauxc workspace &

# Get the process ID of the transpiler
transpiler_pid=$!

# Wait for 20 seconds
sleep 20

# Check if the transpiler is still running
if kill -0 "$transpiler_pid" >/dev/null 2>&1; then
  # If it is, kill it
  kill "$transpiler_pid"
fi

# Finally exit!
exit 0