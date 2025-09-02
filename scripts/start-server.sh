#!/bin/bash
export PATH=/usr/local/bin:$PATH

echo "Starting The Forest Dedicated Server..."
find /theforest -name "*.exe" -type f
xvfb-run -a wine64 /theforest/TheForestDedicatedServer.exe -serverdatafolder 'Z:/server-data'
