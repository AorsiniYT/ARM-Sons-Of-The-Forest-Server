#!/bin/bash
export PATH=/usr/local/bin:$PATH

echo "Starting The Forest Dedicated Server..."
echo "Contents of /theforest:"
ls -la /theforest
echo "Looking for .exe files:"
find /theforest -name "*.exe" -type f 2>/dev/null || echo "No .exe files found"
echo "Contents of steamapps if exists:"
ls -la /theforest/steamapps 2>/dev/null || echo "steamapps not found"
xvfb-run -a wine64 /theforest/TheForestDedicatedServer.exe -serverdatafolder 'Z:/server-data'
